(defvar *emacs-load-start* (current-time))

;;; Emacs Load Path
;;; This should add ~/emacs/lisp/ and all its subdirectories
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (let* ((my-lisp-dir "~/emacs/")
              (default-directory my-lisp-dir))
           (setq load-path (cons my-lisp-dir load-path))
           (normal-top-level-add-subdirs-to-load-path)))

(load-library "ajw-config")
(load-library "ajw-color-config")
(load-library "ajw-modes-config")


;;; Windows specific stuff...
(if (eq system-type 'windows-nt)
    (load-library "ajw-winnt-config"))


;;; FreeBSD specific stuff
(if (eq system-type 'berkeley-unix)
    (load-library "ajw-bsd-config"))


;;; Tell me how long it took, cap'n
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                           (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))