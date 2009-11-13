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

