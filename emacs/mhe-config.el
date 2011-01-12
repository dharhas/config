;;; MH-E mode for email
(add-hook 'mh-folder-mode-hook
          (lambda () (setq split-height-threshold 20)))

(add-hook 'mh-letter-mode-hook
	  (lambda () (flyspell-mode 1)))

;;; Turn on display time mode for mail notification
(setq display-time-format "")  ; don't need time string in modeline

(defface display-time-mail-face '((t (:background "red")))
    "If display-time-use-mail-icon is non-nil its background
     color is that of this face. Should be disting from
     mode-line. Note that thtis does not seem to affect
     display-time-mail-string as claimed.")

(setq
 display-time-mail-file "/var/mail/wilsaj"
 display-time-use-mail-icon nil
 display-time-mail-face 'display-time-mail-face
 display-time-interval 10)

(display-time-mode t)