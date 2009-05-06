
;;; psvn.el (subversion)
(require 'psvn)



;;; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\js$" . js2-mode))





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
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(add-hook 'org-mode-hook 'turn-on-font-lock)




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
(require 'icicles) 
;(icicle-mode 1)
;(icomplete-mode 99)
;(require 'icomplete+)
(eval-after-load "icomplete" '(progn (require 'icomplete+)))



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

