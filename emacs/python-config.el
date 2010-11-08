;;; python mode...
;;; XXX: make this and the rest of python stuff lazy load
;;;      when .emacs init is generalized for Win + UNIX
(autoload 'python-mode "python-mode" "Python Mode." t)
(autoload 'cython-mode "cython-mode" "Cython Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

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
