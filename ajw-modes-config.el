;;; TODO: CLEAN THIS UP!!!

;;; ahg is a really nice mercurial mode
(require 'ahg)

;;; nav mode; also look into speedbar for use on windowed systems
(require 'nav)

;;; yasnippets
(require 'yasnippet)
(yas/initialize)

;;; Keep my snippets in ~/snippets/personal, but also use
;;; ~/snippets/external (snippets developed by other ppl)
(setq yas/root-directory (list (concat emacs-root "/snippets/personal")
                               (concat emacs-root "/snippets/external")))
(mapc 'yas/load-directory yas/root-directory)



;;; uniquify makes duplicate buffer names something useful, rather
;;; than buffername<n>
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")


;;; js2-mode
(autoload 'js2-mode "js2" nil t)
(setq js2-basic-offset 4)
; XXX: this can be a problem when working with OpenLayers
(setq js2-cleanup-whitespace nil) 
(add-to-list 'auto-mode-alist '("\\js$" . js2-mode))


;;; django-mode
(autoload 'django-mode "django-mode" nil t)
(add-to-list 'auto-mode-alist '("\\html$" . django-mode))


;;; irfc.el
(require 'irfc)
;; note: will need to make a ~/.emacs.d/RFC directory for caching RFCs


;;; XXX: figure this out some time
;;; flymake-js (experimental)
;(require 'flymake-js)

(require 'flymake-jslint)
;(add-hook 'js2-mode-hook
;	  (lambda () (flymake-mode t)))


;;; flyspell
;ispell-program-name is defined in OS-specific files
;(setq ispell-program-name "c:\\Program Files\\Aspell\\bin\\aspell")



;;; tramp
(setq tramp-default-method "ssh")


;;; Ido
(require 'ido)
(ido-mode 1)


;;; python mode...
;;; XXX: make this and the rest of python stuff lazy load
;;;      when .emacs init is generalized for Win + UNIX
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))


;;; ipython
;;; XXX: for global .emacs file: seperate out the pylab backend args
;;;      (e.g. -wthread) per OS
;; ipython-command is now in OS-specific file
;; should also put py-python-command-args?
;(setq ipython-command "c:\\Python25\\Scripts\\ipython")
(setq ipython-command "ipython")
(setq py-python-command-args '("-pylab" "-wthread" "-colors" "Linux" "-automagic"))
(eval-after-load "python-mode"
 '(progn
    (load-library "ipython")
 ))


;;; Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)


;;; Ropemacs
(eval-after-load "python-mode"
  '(progn
    (pymacs-load "ropemacs" "rope-")
  ))




;;; Org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(add-hook 'org-mode-hook 'turn-on-font-lock)


;;; Hiding leading stars for cleaner appearance
(setq org-hide-leading-stars t)

;;; Will need to re-align a few files so figure out how to do this
;;; before making it permanent
(setq org-odd-levels-only t)


;(setq org-todo-keywords
;       '((sequence "TODO" "STARTED" "WAITING" "|" "DONE" "CANCELLED")))

(setq org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
				(sequence "WAITING(w@/!)" "|" "CANCELLED(c@/!)"))))


(setq org-todo-keyword-faces (quote (("TODO" :foreground "pink" :weight bold)
				     ("STARTED" :foreground "orange" :weight bold)
				     ("DONE" :foreground "green" :weight bold)
				     ("WAITING" :foreground "yellow" :weight bold)
				     ("CANCELLED" :foreground "green" :weight bold))))


; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@Work" . ?w)
                            ("@Home" . ?h)
                            (:endgroup)
			    (:startgroup)
                            ("@GIS" . ?g)
                            ("@NOC" . ?n)
                            (:endgroup)
                            ("FARM" . ?F)
                            ("HOME" . ?H)
                            ("CANCELLED" . ?C))))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))


;;; Don't do wacky things in headlines
(setq org-special-ctrl-k t)

;;; Ido is nice
(setq org-completion-use-ido t)
(setq org-cycle-separator-lines 2)

; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 8:00"))))


;;; Notes on Ido and Icicles
;;; ------------------------------------------------------------
;;;  By default, Ido will clash with Icicles and things don't work by
;;;   with both of them on
;;;
;;;  Look into enabling Ido for opening files and buffers
;;;   and Icicles for everything else
;;;
;;; * Look into hooking Icicles up to ropemacs for autocompletion
;;;  




;;; Icicles 
;;; XXX: Icicles should get loaded last so overwrites a few key bindings
;;; NOTE: Icicles overwrites a few key bindings
;(require 'icicles) 
;(icicle-mode 1)
;(icomplete-mode 99)
;(require 'icomplete+)
;(eval-after-load "icomplete" '(progn (require 'icomplete+)))



;;; NXML-mode
(load-library "rng-auto.el")
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|\\|xhtml\\)\\'" . nxml-mode)
	    auto-mode-alist))

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

