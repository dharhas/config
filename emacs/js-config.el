;;; javascript editting
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
