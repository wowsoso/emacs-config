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



(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE")))

(setq org-log-done 'time)

(setq org-ditaa-jar-path "/usr/bin/ditaa")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))

(require 'table)
(add-hook 'text-mode-hook 'table-recognize)
(add-hook 'org-mode-hook 'table-recognize)
