;;; yasnippet config
(require 'yasnippet)
(yas/initialize)

;;; Keep my snippets in ~/snippets/personal, but also use
;;; ~/snippets/external (snippets developed by other ppl)
(setq yas/root-directory (list (concat emacs-root "/snippets/personal")
                               (concat emacs-root "/snippets/external")))
(mapc 'yas/load-directory yas/root-directory)

