
;;; C-x C-m = M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;;; Backward kill-word = awesome
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;;; Don't wastes my spaces
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;; Indent 4 spaces
(setq custom-buffer-indent 4)

;;; Windmove: change windows with shift + arrow
(windmove-default-bindings 'shift)

;;; Don't make me type yes or no
(defalias 'yes-or-no-p 'y-or-no-p)

;; Use control-arrow keys for window resizing
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)