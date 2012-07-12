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
