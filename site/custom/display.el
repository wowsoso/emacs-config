(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(global-set-key [f11] 'toggle-fullscreen)
(add-hook 'after-make-frame-functions 'toggle-fullscreen)
(toggle-fullscreen)


(global-set-key [f5] 'revert-buffer)

(global-set-key (kbd "RET") '(lambda () (interactive) (progn (paredit-newline) (whitespace-cleanup))))

(global-hl-line-mode t) ;; To enable
(set-face-background 'hl-line "black") ;; change with the color that you like

;;; Show column numbers in the mode line.
(column-number-mode t)
;;; Highlight open and close parenthesis when the point is on them.
(show-paren-mode t)


;;; OS level copy / paste
(setq x-select-enable-clipboard t)
;;; no auto backup
(setq make-backup-files nil)

(prefer-coding-system 'utf-8)