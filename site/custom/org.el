;;TODO
(defvar todo_path "~/.emacs.d/global.org")
(defvar note_path "~/.emacs.d/note.org")
(defvar blog_path "~/.emacs.d/blog.org")
(defvar blog_path "~/.emacs.d/work.org")
(defvar life_path "~/.emacs.d/life.org")


(global-set-key (kbd "M-<f1>")
                '(lambda ()
                   (interactive)
                   (find-file todo_path)))

(global-set-key (kbd "M-<f2>")
                '(lambda ()
                   (interactive)
                   (find-file note_path)))


(global-set-key (kbd "M-<f3>")
                '(lambda ()
                   (interactive)
                   (find-file blog_path)))


(global-set-key (kbd "M-<f4>")
                '(lambda ()
                   (interactive)
                   (find-file work_path)))


(global-set-key (kbd "M-<f5>")
                '(lambda ()
                   (interactive)
                   (find-file life_path)))


(setq org-log-done 'note)
