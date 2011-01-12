;;; sh-mode config
(setq sh-learn-basic-offset "guess")
(add-hook 'sh-set-shell-hook 'sh-learn-buffer-indent)
