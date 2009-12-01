;;; Auto-complete (WORK IN PROGRESS)
(when (require 'auto-complete nil t)
  (require 'auto-complete-config)
  (global-auto-complete-mode t)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  (setq ac-auto-start nil)
  
  (global-set-key "\M-/" 'ac-start)
  (define-key ac-complete-mode-map "\M-/" 'ac-stop)
  (setq ac-dwim nil)
  
  (setq-default ac-sources '(ac-source-words-in-buffer ac-source-yasnippet))
  
  (add-hook 'python-mode-hook
            (lambda ()
              (setq ac-sources '(ac-source-ropemacs ac-source-yasnippet )))))

  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (setq ac-sources '(ac-source-words-in-buffer ac-source-yasnippet ))))


;;; swiped and modified from from enigmacurry.com (dude's name is ryan)
;;Ryan's python specific tab completion
  ; Try the following in order:
  ; 1) Try a yasnippet expansion without autocomplete
  ; 2) If at the beginning of the line, indent
  ; 3) If at the end of the line, try to autocomplete
  ; 4) If the char after point is not alpha-numerical, try autocomplete
  ; 5) Try to do a regular python indent.
  ; 6) If at the end of a word, try autocomplete.

(add-hook 'yas/minor-mode-hook
          (lambda ()
            (define-key yas/minor-mode-map "\t" 'yas/expand)
            (define-key yas/minor-mode-map "\t" 'try-expand-after-yasnippet)))

(defun try-indent ()
  "Runs indent-for-tab-command but returns t if it actually did an indent; nil otherwise"
  (let ((prev-point (point)))
    (indent-for-tab-command)
    (if (eql (point) prev-point)
        nil
      t)))

(defun try-expand-after-yasnippet ()
  (interactive)
  ;;2) Try indent at beginning of the line
  (let ((prev-point (point))
        (beginning-of-line nil))
    (save-excursion
      (move-beginning-of-line nil)
      (if (eql 0 (string-match "\\W*$" (buffer-substring (point) prev-point)))
          (setq beginning-of-line t)))
    (if beginning-of-line
        (try-indent)))
  ;;3) Try autocomplete if at the end of a line, or
  ;;4) Try autocomplete if the next char is not alpha-numerical
  (if (or (string-match "\n" (buffer-substring (point) (+ (point) 1)))
          (not (string-match "[a-zA-Z0-9]" (buffer-substring (point) (+ (point) 1)))))
      (ac-start)
    ;;5) Try a regular indent
    (if (not (try-indent))
        ;;6) Try autocomplete at the end of a word
        (if (string-match "\\W" (buffer-substring (point) (+ (point) 1)))
            (ac-start)))))

;; End Tab completion
