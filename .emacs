(defvar *emacs-load-start* (current-time))

(defvar config-root (if (eq system-type 'windows-nt) 
                       "C:/andy/config/"
                       "/home/wilsaj/config/")
        "My general configuration home directory")

(defvar emacs-root (concat config-root "emacs")
        "My emacs configuration home directory")


;;; Emacs Load Path
;;; This should add ~/emacs/lisp/ and all its subdirectories
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (let* ((my-lisp-dir (concat emacs-root "/lisp"))
               (default-directory my-lisp-dir))
           (setq load-path (cons my-lisp-dir load-path))
           (normal-top-level-add-subdirs-to-load-path)))

(add-to-list 'load-path emacs-root)

;;; General stuff - keybindings, settings, etc
(load-library "general-config")

;;; How to make pretty
(load-library "color-config")


;------------ mode configuration -------------------------------------

;;; yasnippets - super handy general templating
;;;   note: other config files depend on yasnippet being initialized
(load-library "yasnippet-config")

;;; ahg for mercurial version control
(load-library "ahg-config")

;;; autocomplete setup
(load-library "autocomplete-config")

;;; auctex for latex editting
(load-library "auctex-config")

;;; django template editing
(load-library "django-config")

;;; etags select mode for code navigation
(load-library "etags-config")

;;; flyspell for on-the-fly spellchecking
(load-library "flyspell-config")

;;; irfc mode for reading RFC's
;; note: you will need to createa a ~/.emacs.d/RFC directory for
;;       caching RFCs
(load-library "irfc-config")

;;; haskell language editting
(load-library "haskell-config")

;;; ido completion
(load-library "ido-config")

;;; javascript editting
(load-library "js-config")

;; lua programming language
(load-library "lua-config")

;;; nav mode; also look into speedbar for use on windowed systems
(load-library "nav-config")

;;; Magit for git version control
(load-library "magit-config")

;;; MH-E mode for email
(load-library "mhe-config")

;;; NXML for editting xml (and html)
(load-library "nxml-config")

;;; org mode setup
(load-library "org-config")

;;; python mode setup
(load-library "python-config")

;;; scheme language editting
(load-library "scheme-config")

;;; sh script editting
(load-library "sh-config")

;;; tramp for remote access
(load-library "tramp-config")

;;; uniquify makes duplicate buffer names something useful, rather
;;; than buffername<n>
(load-library "uniquify-config")

;;; zen coding for html wizardry
(load-library "zen-config")

;------------ end mode configuration ---------------------------------


;;; windows specific stuff
(if (eq system-type 'windows-nt)
    (load-library "winnt-config"))

;;; Tell me how long it took, for tuning emacs configs
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))