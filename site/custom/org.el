;;TODO
(defvar todo_path "~/.emacs.d/global.org")
(global-set-key (kbd "M-<f1>")
                '(lambda ()
                   (interactive)
                   (find-file todo_path)))

(setq org-log-done 'note)
