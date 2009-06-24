;;; Color theme it...
(require 'color-theme)
(color-theme-initialize)
(if window-system
    (color-theme-tango)
    (color-theme-clarity))

;;; Taylor is a beautiful theme but it fargles up the bold - this fixes that
;(set-face-background 'bold "unspecified") 
