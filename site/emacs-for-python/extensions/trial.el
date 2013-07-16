;;; trial.el --- a simple wrap for trial test
;; author: soso wang
;; emacs: wowsososo@gmail.com

(defvar trial-path "/usr/local/bin/trial")
(defvar test-file-default-path "./tests.py")
(defvar output-buffer-name "*trial*")


(defun run-trial-defualt ()
  "run trial by defualt dir"
    (interactive)
    (kill-buffer (get-buffer-create output-buffer-name))
    (if (null (cdr (window-list)))
        (setq onewindow t)
      (setq onewindow nil))
    (let ((process (start-process-shell-command trial-path output-buffer-name trial-path "" test-file-default-path)))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) output-buffer-name)
             (setq kid-sdcv-window-configuration (current-window-configuration))
             (switch-to-buffer-other-window output-buffer-name)
             (local-set-key (kbd "q") (lambda ()
                                        (interactive)
                                        (if (eq onewindow t)
                                            (delete-window)
                                          (progn (bury-buffer) (other-window 1))))))
           (goto-char (point-min)))))))


(defun run-trial-current-file ()
  "run trial by current file"
    (interactive)
    (kill-buffer (get-buffer-create output-buffer-name))
    (if (null (cdr (window-list)))
        (setq onewindow t)
      (setq onewindow nil))
    (let ((process (start-process-shell-command trial-path output-buffer-name trial-path ""  (buffer-file-name))))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) output-buffer-name)
             (setq kid-sdcv-window-configuration (current-window-configuration))
             (switch-to-buffer-other-window output-buffer-name)
             (local-set-key (kbd "q") (lambda ()
                                        (interactive)
                                        (if (eq onewindow t)
                                            (delete-window)
                                          (progn (bury-buffer) (other-window 1))))))
           (goto-char (point-min)))))))

(provide 'trial)
