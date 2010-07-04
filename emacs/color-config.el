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



(setq buffer-menu-buffer-font-lock-keywords
      '(("^....[*]Man .*Man.*"   . font-lock-variable-name-face) ;Man page
        (".*Dired.*"             . font-lock-comment-face)       ; Dired
        ("^....[*]shell.*"       . font-lock-preprocessor-face)  ; shell buff
        (".*[*]scratch[*].*"     . font-lock-function-name-face) ; scratch buffer
        ("^....[*].*"            . font-lock-string-face)        ; "*" named buffers
        ("^..[*].*"              . font-lock-constant-face)      ; Modified
        ("^.[%].*"               . font-lock-keyword-face)))     ; Read only

(defun buffer-menu-custom-font-lock  ()
  (let ((font-lock-unfontify-region-function
         (lambda (start end)
           (remove-text-properties start end '(font-lock-face nil)))))
    (font-lock-unfontify-buffer)
    (set (make-local-variable 'font-lock-defaults)
         '(buffer-menu-buffer-font-lock-keywords t))
    (font-lock-fontify-buffer)))

(add-hook 'buffer-menu-mode-hook 'buffer-menu-custom-font-lock)