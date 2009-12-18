;;; Org mode setup
;;; Much of this should be attributed to http://doc.norang.ca/org-mode.html
(require 'org-install)

;;; Have org open files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;;; Flyspell is good - so is font-lock
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

(defun bh/start-clock-if-needed ()
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward " *CLOCK-IN: *" nil t)
      (replace-match "")
      (org-clock-in))))


;;; Use ~/org/ directory as the home for agenda files
(setq org-agenda-files (quote ("~/org/dir.org"
                               "~/org/learn.org"
                               "~/org/todo.org"
                               "~/org/refile.org")))

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

;;; Collapse one empty line after a subtree
(setq org-cycle-separator-lines 2)

;;;; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

;;;; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 8:00"))))



;;; Remember setup
(require 'remember)
(org-remember-insinuate)

;;; Put remember notes into this file
(setq org-default-notes-file "~/org/refile.org")

;;; Keep clocks running on exit
(setq org-remember-clock-out-on-exit nil)

;;; Let refile targets be anything in agenda files (up to 5 headers deep)
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) 
                                 (nil :maxlevel . 5))))

;;; Targets start with athe file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))

;;; Targets complete in steps so we start with a filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)

;;; Start clock if a remember buffer includes  :CLOCK-IN:
(add-hook 'remember-mode-hook 'bh/start-clock-if-needed 'append)

;;; C-c C-c stores the note immediately
(setq org-remember-store-without-prompt t)

;;; Default headline to file remember notes under
(setq org-remember-default-headline "Tasks")

;;; Remember templates
(setq org-remember-templates
      '(("todo" ?t "* TODO %?\n  %u\n   %a" nil bottom nil)
        ("note" ?n "* %?                                                                     :NOTE:\n  %u\n  %a" nil bottom nil)))



;;; Agenda setup
(setq org-agenda-custom-commands
      (quote (("s" "Started Tasks" todo "STARTED" ((org-agenda-todo-ignore-scheduled nil)
                                                   (org-agenda-todo-ignore-deadlines nil)
                                                   (org-agenda-todo-ignore-with-date nil)))
              ("w" "Tasks waiting on something" tags "WAITING/!" ((org-use-tag-inheritance nil)))
              ("r" "Refile New Notes and Tasks" tags "LEVEL=1+REFILE" ((org-agenda-todo-ignore-scheduled nil)
                                                                       (org-agenda-todo-ignore-deadlines nil)
                                                                       (org-agenda-todo-ignore-scheduled nil)))
              ("N" "Notes" tag "NOTE" nil)
              ("n" "Next" tags "NEXT-WAITING-CANCELLED/!" nil)
              ("p" "Projects" tags-todo "LEVEL=2-NEXT-WAITING-CANCELLED/!-DONE" nil)
              ("A" "Tasks to be Archived" tags "LEVEL=2/DONE|CANCELLED" nil)
              ("h" "Habits" tags "STYLE=\"habit\"" ((org-agenda-todo-ignore-scheduled nil)
                                                    (org-agenda-todo-ignore-deadlines nil)
                                                    (org-agenda-todo-ignore-with-date nil))))))



;;; Clock setup

;;; Resume clocking tasks when emacs is restarted
(org-clock-persistence-insinuate)

;;; long clock history
(setq org-clock-history-length 35)

;;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)

;;; Set tasks to started when they are clocked in
(setq org-clock-in-switch-to-state "STARTED")

;;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK" "CLOCK")))

;;; Save clock data in the CLOCK drawer and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer "CLOCK")

;;; Don't bother clocking tasks with 0:00 duration - (for when accidentally hitting clockin, e.g.)
(setq org-clock-out-remove-zero-time-clocks-t)

;;; Don't clock out when moving task to a done state
(setq org-clock-out-when-done nil)

;;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist (quote history))


;;; Log state changes into :LOGBOOK: drawer
(setq org-log-into-drawer t)
