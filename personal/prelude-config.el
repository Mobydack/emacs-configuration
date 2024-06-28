(prelude-require-packages '(transpose-frame perfect-margin))

(use-package perfect-margin
  :custom
  (perfect-margin-visible-width 128)
  :config
  ;; enable perfect-mode
  (perfect-margin-mode t)
  ;; auto-center special windows
  (setq perfect-margin-ignore-regexps nil))

(provide 'prelude-config)
