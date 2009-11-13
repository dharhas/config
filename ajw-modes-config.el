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



;;; django-mode
(autoload 'django-mode "django-mode" nil t)
(add-to-list 'auto-mode-alist '("\\html$" . django-mode))


;;; irfc.el
(require 'irfc)
;; note: will need to make a ~/.emacs.d/RFC directory for caching RFCs


;;; js2-mode
(autoload 'js2-mode "js2" nil t)
(setq js2-basic-offset 4)
; XXX: this can be a problem when working with OpenLayers
(setq js2-cleanup-whitespace nil) 
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


;;; Ido
(require 'ido)
(ido-mode 1)







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