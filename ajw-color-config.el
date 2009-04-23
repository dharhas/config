;;; Color theme it...
(require 'color-theme)
(color-theme-initialize)
(color-theme-taylor)
;;; such a beautiful theme but it fargles up the bold - this fixes that
(set-face-background 'bold "unspecified") 
