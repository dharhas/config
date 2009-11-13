;;; Color theme it...
(require 'color-theme)
(color-theme-initialize)

;;; If on X, use Tango 
;;; If on Windows, use Taylor
;;; If on console/tty, use clarity
(if window-system
   (if (eq system-type 'windows-nt) 
	(list (color-theme-taylor)
	      (set-face-background 'bold "unspecified"))
        (color-theme-tango-darkbg))
    (color-theme-clarity))

;;; Class it up a bit with some not-quite-black
(set-background-color "gray10")