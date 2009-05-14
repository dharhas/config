;;; Windows hooks, should only be called by .emacs when running on windows



;;; Hook into ls-lisp (because Windows dir cmd sucks)
(add-hook 'dired-load-hook
	  (lambda () (load "ls-lisp")))


;;; Mode-specific stuff
(setq ipython-command "c:\\Python25\\Scripts\\ipython")
(setq ispell-program-name "c:\\Program Files\\Aspell\\bin\\aspell")