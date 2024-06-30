(prelude-require-packages '(transpose-frame perfect-margin all-the-icons-ibuffer all-the-icons))

(setq projectile-project-search-path '(("~/repos" . 6))) 

(use-package perfect-margin
  :custom
  (perfect-margin-visible-width 128)
  :config
  ;; enable perfect-mode
  (perfect-margin-mode t)
  ;; auto-center special windows
  (setq perfect-margin-ignore-regexps nil))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(provide 'prelude-config)
