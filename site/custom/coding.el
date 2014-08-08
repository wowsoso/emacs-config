(setq auto-save-default nil)
(add-hook 'python-mode-hook 'turn-on-orgstruct++)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;magit
(add-load-path "magit")
(require 'magit)
(require 'magit-blame)
(define-prefix-command 'ctl-\,-map)
(global-set-key (kbd "C-,") 'ctl-\,-map)
(define-key ctl-\,-map (kbd "gst") 'magit-status)


;;; custom lib
(mapcar (lambda (file)  (load-file (concat "~/.emacs.d/site/custom/language/" file)))
        (list "c.el"))


(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(remove-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key [f1] 'magit-status)
