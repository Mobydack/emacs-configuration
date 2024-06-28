;; Window
(when (window-system)
    (push '(fullscreen . maximized) default-frame-alist))

;; Font

;; Whitespace
(setq prelude-clean-whitespace-on-save nil)
(setq prelude-whitespace t)

(provide 'preload)