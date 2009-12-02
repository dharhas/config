;;; Org mode setup
(require 'org-install)

;;; Open org stuff
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;;; Hooks for org mode
(add-hook 'org-mode-hook
          (lambda()
            (turn-on-font-lock)
            (flyspell-mode 1)))

;;; Key maps
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key (kbd "<f5>") 'bh/org-todo)
(global-set-key (kbd "<S-f5>") 'widen)
(global-set-key (kbd "<f7>") 'set-truncate-lines)
(global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "C-<f10>") 'next-buffer)
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
(global-set-key (kbd "M-<f11>") 'org-resolve-clocks)
(global-set-key (kbd "C-M-r") 'org-remember)


;;; Special functions
(defun bh/org-todo ()
  (interactive)
  (org-narrow-to-subtree)
  (org-show-todo-tree nil))

;;; Use ~/org/ directory as the home for agenda files
(setq org-agenda-files (quote ("~/org/")))

;;; Hiding leading stars for cleaner appearance
(setq org-hide-leading-stars t)

;;; Will need to re-align a few files so figure out how to do this
;;; before making it permanent
(setq org-odd-levels-only t)

;;; Keep shift-arrow keys as they set for windmove
(setq org-replace-disputed-keys t)

;(setq org-todo-keywords
;       '((sequence "TODO" "STARTED" "WAITING" "|" "DONE" "CANCELLED")))

(setq org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s!)" "|" "DONE(d!/!)")
                                (sequence "WAITING(w@/!)" "SOMEDAY(S!)" "|" "CANCELLED(c@/!)"))))


(setq org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
                                     ("STARTED" :foreground "blue" :weight bold)
                                     ("DONE" :foreground "green" :weight bold)
                                     ("WAITING" :foreground "orange" :weight bold)
                                     ("SOMEDAY" :foreground "magenta" :weight bold)
                                     ("CANCELLED" :foreground "green" :weight bold))))

;;; Set tasks to started when they are clocked in
(setq org-clock-in-switch-to-state "STARTED")

;;; Tags with fast selection keys
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

;;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

;;; Don't do wacky things in headlines
(setq org-special-ctrl-k t)

;;; Ido is nice
(setq org-completion-use-ido t)
(setq org-cycle-separator-lines 2)

;;;; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

;;;; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 8:00"))))


;;; Set up remember
(require 'remember)
(org-remember-insinuate)

;;; Put remember notes into this file
(setq org-default-notes-file "~/org/refile.org"))

;;; Start clock if a remember buffer includes  :CLOCK-IN:
(add-hook 'remember-mode-hook 'bh/start-clock-if-needed 'append)

(defun bh/start-clock-if-needed ()
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward " *CLOCK-IN: *" nil t)
      (replace-match "")
      (org-clock-in))))

;;; Keep clocks running
(setq org-remember-clock-out-on-exit nil)

;;; C-c C-c stores the note immediately
(setq org-remember-store-without-prompt t)

;;; Default headline to file remember notes under
(setq org-remember-default-headline "Tasks")

;;; Remember templates
(setq org-remember-templates
      '(("todo" ?t "* TODO %?\m  %u\n   %a" nil bottom nil)
        ("note" ?n " %?                                            :NOTE:\n  %u\n  %a" nil bottom nil)))
