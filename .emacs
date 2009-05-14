(defvar *emacs-load-start* (current-time))

;;; Emacs Load Path
;;; This should add ~/emacs/lisp/ and all its subdirectories
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (let* ((my-lisp-dir "~/emacs/")
              (default-directory my-lisp-dir))
           (setq load-path (cons my-lisp-dir load-path))
           (normal-top-level-add-subdirs-to-load-path)))

;;; General stuff - keybindings, settings, etc
(load-library "ajw-config")

;;; How to make pretty
(load-library "ajw-color-config")

;;; Modes and their settings
(load-library "ajw-modes-config")


;;; Windows specific stuff
(if (eq system-type 'windows-nt)
    (load-library "ajw-winnt-config"))


;;; FreeBSD specific stuff
(if (eq system-type 'berkeley-unix)
    (load-library "ajw-bsd-config"))


;;; Tell me how long it took, for tuning emacs configs
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                           (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))