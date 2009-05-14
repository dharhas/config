;;; General config stuff goes here - setting up keybindings and useful variables and that sort of stuff


;; Keybindings 

;;; C-x C-m = M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;;; Backward kill-word = awesome
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;;; Windmove: change windows with shift + arrow
(windmove-default-keybindings 'shift)

;;; Use control-arrow keys for window resizing
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-up>") 'shrink-window)

;;; Send this buffer to the hinterland
(global-set-key [f8] 'bury-buffer)

;;; So I can kill (and thus paste) text from read-only buffer
(setq kill-read-only-ok 1)




;; Variables

;;; Indent 4 spaces
(setq custom-buffer-indent 4)

;;; Echo unfinished keystrokes in the minibuffer
(setq echo-keystrokes 0.1)

;;; Make cut & paste work with the xorg clipboard
(setq x-select-enable-clipboard t)

;;; Don't clutter up directories with backup files 
(push '("." . "~/.emacs-backups") backup-directory-alist)




;; Functional / General Settings

;;; Don't wastes my spaces
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;; Don't make me type yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;;; Winner mode for reverting layouts
(winner-mode 1)

;;; Don't need to see splash screen
(setq inhibit-startup-message t)