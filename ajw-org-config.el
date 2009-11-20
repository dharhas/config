;;; Org mode setup
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(add-hook 'org-mode-hook 
          (lambda()
            (turn-on-font-lock)
            (flyspell-mode 1)))
            


;;; Hiding leading stars for cleaner appearance
(setq org-hide-leading-stars t)

;;; Will need to re-align a few files so figure out how to do this
;;; before making it permanent
(setq org-odd-levels-only t)

;;; Keep shift-arrow keys as they set for windmove
(setq org-replace-disputed-keys t)

;(setq org-todo-keywords
;       '((sequence "TODO" "STARTED" "WAITING" "|" "DONE" "CANCELLED")))

(setq org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
				(sequence "WAITING(w@/!)" "|" "CANCELLED(c@/!)"))))


(setq org-todo-keyword-faces (quote (("TODO" :foreground "pink" :weight bold)
				     ("STARTED" :foreground "orange" :weight bold)
				     ("DONE" :foreground "green" :weight bold)
				     ("WAITING" :foreground "yellow" :weight bold)
				     ("CANCELLED" :foreground "green" :weight bold))))


; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@Work" . ?w)
                            ("@Home" . ?h)
                            (:endgroup)
			    (:startgroup)
                            ("@GIS" . ?g)
                            ("@NOC" . ?n)
                            (:endgroup)
                            ("FARM" . ?F)
                            ("HOME" . ?H)
                            ("CANCELLED" . ?C))))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))


;;; Don't do wacky things in headlines
(setq org-special-ctrl-k t)

;;; Ido is nice
(setq org-completion-use-ido t)
(setq org-cycle-separator-lines 2)

; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 8:00"))))
