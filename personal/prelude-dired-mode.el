(prelude-require-packages '(treemacs-icons-dired))

(use-package treemacs-icons-dired
  :ensure t
  :hook (dired-mode . treemacs-icons-dired-enable-once))

(provide 'prelude-dired-mode)
