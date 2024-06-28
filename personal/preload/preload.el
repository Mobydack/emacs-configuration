;; Window
(when (window-system)
    (push '(fullscreen . maximized) default-frame-alist))

;; Font
(let ((fonts '(
    "Iosevka"
    "Hack Nerd Font Propo"
    "Fira Code"
    "Source Code Pro"
    "Menlo" "Consolas"
    "Courier New"))
    (found-font nil))
(while (and fonts (not found-font))
    (if (member (car fonts) (font-family-list))
        (setq found-font (car fonts))
    (setq fonts (cdr fonts))))
(if found-font
    (set-face-attribute 'default nil :family found-font :height 160)
    (message "No specified fonts found, using default.")))

;; Whitespace
(setq prelude-clean-whitespace-on-save nil)
(setq prelude-whitespace t)

(provide 'preload)