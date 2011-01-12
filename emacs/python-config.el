;;; python mode
;;; XXX: make this and the rest of python stuff lazy load
;;;      when .emacs init is generalized for Win + UNIX
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;; cython mode
(autoload 'cython-mode "cython-mode" "Cython Mode." t)
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))

;;; set python path explicitly to python2 for now
(setq py-python-command "/usr/bin/python2")
(setenv "PYMACS_PYTHON" "/usr/bin/python2")

;;; ipython
;;; XXX: for global .emacs file: seperate out the pylab backend args
;;;      (e.g. -wthread) per OS
;; ipython-command is now in OS-specific file
;; should also put py-python-command-args?
;(setq ipython-command "c:\\Python25\\Scripts\\ipython")
(setq ipython-command "ipython")
(load-library "ipython")
(setq py-python-command-args '("--pylab" "qt" "--automagic"))

;; set IPYTHONDIR directly, as it isn't automatically inferred by
;; emacs from the shell environment
(setenv "IPYTHONDIR" (concat config-root "/.ipython/"))


;;; Load virtualenv.el
(load-library "virtualenv")



;;; Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;;; Ropemacs
(pymacs-load "ropemacs" "rope-")

;; NOTE: this lazy-loads ropemacs. Replace the line above with the
;; commented code below if slow startup is an issue.
;;
;; (eval-after-load "python-mode"
;;   '(progn
;;     (pymacs-load "ropemacs" "rope-")
;;   ))



;;; Very slightly modified py-fill-comment function, to allow for
;;; sphinx autodoc style comments (hash followed by a colon)
(defun py-fill-comment (&optional justify)
  "Fill the comment paragraph around point"
  (let (;; Non-nil if the current line contains a comment.
        has-comment

        ;; If has-comment, the appropriate fill-prefix for the comment.
        comment-fill-prefix)

    ;; Figure out what kind of comment we are looking at.
    (save-excursion
      (beginning-of-line)
      (cond
       ;; A line with nothing but a comment on it?
; -------------------------------------------------------
; CHANGED THIS LINE:
;      ((looking-at "[ \t]*#[# \t]*")
; -------------------------------------------------------
       ((looking-at "[ \t]*#[# \t:]*")
        (setq has-comment t
              comment-fill-prefix (buffer-substring (match-beginning 0)
                                                    (match-end 0))))

       ;; A line with some code, followed by a comment? Remember that the hash
       ;; which starts the comment shouldn't be part of a string or character.
       ((progn
          (while (not (looking-at "#\\|$"))
            (skip-chars-forward "^#\n\"'\\")
            (cond
             ((eq (char-after (point)) ?\\) (forward-char 2))
             ((memq (char-after (point)) '(?\" ?')) (forward-sexp 1))))
          (looking-at "#+[\t ]*"))
        (setq has-comment t)
        (setq comment-fill-prefix
              (concat (make-string (current-column) ? )
                      (buffer-substring (match-beginning 0) (match-end 0)))))))

    (if (not has-comment)
        (fill-paragraph justify)

      ;; Narrow to include only the comment, and then fill the region.
      (save-restriction
        (narrow-to-region

         ;; Find the first line we should include in the region to fill.
         (save-excursion
           (while (and (zerop (forward-line -1))
                       (looking-at "^[ \t]*#")))

           ;; We may have gone to far.  Go forward again.
           (or (looking-at "^[ \t]*#")
               (forward-line 1))
           (point))

         ;; Find the beginning of the first line past the region to fill.
         (save-excursion
           (while (progn (forward-line 1)
                         (looking-at "^[ \t]*#")))
           (point)))

        ;; Lines with only hashes on them can be paragraph boundaries.
        (let ((paragraph-start (concat paragraph-start "\\|[ \t#]*$"))
              (paragraph-separate (concat paragraph-separate "\\|[ \t#]*$"))
              (fill-prefix comment-fill-prefix))
          ;;(message "paragraph-start %S paragraph-separate %S"
          ;;paragraph-start paragraph-separate)
          (fill-paragraph justify))))
    t))
