;;; tramp for remote access
(setq tramp-default-method "ssh")
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

;; for debugging tramp
;(setq tramp-verbose 10)
;(setq tramp-debug-buffer t

;(add-to-list 'tramp-default-proxies-alist
;             '(nil "\\`root\\'" "/ssh:%h:"))
