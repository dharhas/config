;;; django mode config
(autoload 'django-mode "django-mode" nil t)
(add-to-list 'auto-mode-alist '("\\html$" . django-mode))
