(defgroup leerzeichen nil
  "Faces for highlighting whitespace characters."
  :group 'leerzeichen)

(defface leerzeichen '((t (:foreground "#b8b8b8")))
  "Face for `leerzeichen-mode'."
  :group 'leerzeichen)

(defvar leerzeichen-saved-buffer-display-table nil
  "Stored version of `buffer-display-table' before leerzeichen-mode was enabled.")

(defvar leerzeichen-line-feed-glyph (make-glyph-code ?$ 'leerzeichen))
(defvar leerzeichen-tab-glyph (make-glyph-code ?» 'leerzeichen))
(defvar leerzeichen-space-glyph (make-glyph-code ?· 'leerzeichen))

(defun leerzeichen-display-table ()
  "Display table to highlight whitespace characters."
  (let ((table (make-display-table)))
    (aset table ?\n `[,leerzeichen-line-feed-glyph ?\n])
    (aset table ?\t (vconcat `[,leerzeichen-tab-glyph] (make-vector (1- tab-width) ? )))
    (aset table ?\  `[,leerzeichen-space-glyph])
    table))

;;;###autoload
(define-minor-mode leerzeichen-mode
  "Minor mode to highlight whitespace characters by displaying them differently."
  :lighter " lz"
  :keymap nil
  (if leerzeichen-mode
      (leerzeichen-enable)
    (leerzeichen-disable)))

(defun leerzeichen-enable ()
  "Installs leerzeichen's display table as (buffer local) `buffer-display-table'."
  (unless (or (minibufferp)
              (string-prefix-p " *Minibuf-" (buffer-name))
              (string-prefix-p "*Completions*" (buffer-name))
              (string-prefix-p " *Echo Area" (buffer-name))
              (string-match-p "^\\*\\(Completions\\|compilation\\|Help\\|Messages\\|Warnings\\|Backtrace\\|Flycheck\\|xref\\|shell\\|eshell\\|IELM\\|term\\|ansi-term\\|dired\\|grep\\|Occur\\|Apropos\\|locate\\|Calendar\\|Proced\\|Output\\|Async Shell Command\\|Ibuffer\\|Shell Command Output\\)\\*$" (buffer-name)))
    (setq leerzeichen-saved-buffer-display-table buffer-display-table)
    (setq buffer-display-table (leerzeichen-display-table))))

(defun leerzeichen-disable ()
  "Resets `buffer-display-table' to state before leerzeichen was enabled."
  (unless (or (minibufferp)
              (string-prefix-p " *Minibuf-" (buffer-name))
              (string-prefix-p "*Completions*" (buffer-name))
              (string-prefix-p " *Echo Area" (buffer-name))
              (string-match-p "^\\*\$begin:math:text$Completions\\\\|compilation\\\\|Help\\\\|Messages\\\\|Warnings\\\\|Backtrace\\\\|Flycheck\\\\|xref\\\\|shell\\\\|eshell\\\\|IELM\\\\|term\\\\|ansi-term\\\\|dired\\\\|grep\\\\|Occur\\\\|Apropos\\\\|locate\\\\|Calendar\\\\|Proced\\\\|Output\\\\|Async Shell Command\\\\|Ibuffer\\\\|Shell Command Output\\$end:math:text$\\*$" (buffer-name)))
    (setq buffer-display-table leerzeichen-saved-buffer-display-table)))


;;; Автоматическое включение leerzeichen-mode в основном буфере
(defun leerzeichen-enable-in-main-buffers ()
  "Enable leerzeichen-mode in main buffers but not in minibuffers or special buffers."
  (unless (or (minibufferp)
              (string-prefix-p " *Minibuf-" (buffer-name))
              (string-prefix-p "*Completions*" (buffer-name))
              (string-prefix-p " *Echo Area" (buffer-name))
              (string-match-p "^\\*\$begin:math:text$Completions\\\\|compilation\\\\|Help\\\\|Messages\\\\|Warnings\\\\|Backtrace\\\\|Flycheck\\\\|xref\\\\|shell\\\\|eshell\\\\|IELM\\\\|term\\\\|ansi-term\\\\|dired\\\\|grep\\\\|Occur\\\\|Apropos\\\\|locate\\\\|Calendar\\\\|Proced\\\\|Output\\\\|Async Shell Command\\\\|Ibuffer\\\\|Shell Command Output\\$end:math:text$\\*$" (buffer-name)))
    (leerzeichen-mode 1)))

;;; Добавляем хук для включения режима в основном буфере
(add-hook 'after-change-major-mode-hook 'leerzeichen-enable-in-main-buffers)

(provide 'prelude-leerzeichen-patched)