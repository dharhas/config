(defvar *emacs-load-start* (current-time))

(defvar emacs-root (if (eq system-type 'windows-nt) 
                       "C:/andy/emacs"
                       "/home/wilsaj/emacs")
        "My emacs home directory")


;;; Emacs Load Path
;;; This should add ~/emacs/lisp/ and all its subdirectories
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (let* ((my-lisp-dir (concat emacs-root "/lisp"))
               (default-directory my-lisp-dir))
           (setq load-path (cons my-lisp-dir load-path))
           (normal-top-level-add-subdirs-to-load-path)))

(add-to-list 'load-path emacs-root)

;;; Windows specific stuff
(if (eq system-type 'windows-nt)
    (load-library "ajw-winnt-config"))

;;; FreeBSD specific stuff
(if (eq system-type 'berkeley-unix)
    (load-library "ajw-bsd-config"))

;;; General stuff - keybindings, settings, etc
(load-library "ajw-config")

;;; How to make pretty
(load-library "ajw-color-config")

;;; Modes and their settings
(load-library "ajw-modes-config")

;;; Org mode setup
(load-library "ajw-org-config")

;;; Python mode setup
(load-library "ajw-python-config")

;;; Autocomplete setup
(load-library "ajw-autocomplete-config")

;;; Tell me how long it took, for tuning emacs configs
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))