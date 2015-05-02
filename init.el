;;; Add the site directory to load path.
(defvar *roderic-site-dir* (expand-file-name "~/.emacs.d/site/"))
(add-to-list 'load-path *roderic-site-dir*)

(defun add-load-path (path)
  (add-to-list 'load-path (concat *roderic-site-dir* path)))


(add-to-list 'load-path "~/.emacs.d/elpa/org-8.2/lisp")
(add-to-list 'load-path "~/.emacs.d/elpa/org-8.2/contrib/lisp" t)

(require 'org)


;;; Convenient way to open files and switch buffers.
(ido-mode t)

;;; Allow narrowing without showing a warning.
(put 'narrow-to-region 'disabled nil)

;;; Same for upcase-region
(put 'upcase-region 'disabled nil)

;;; And downcase-region
(put 'downcase-region 'disabled nil)

;;; Indent with spaces, not tabs.
(setq-default indent-tabs-mode nil)

;;; Execute a command without having to use meta.
(global-set-key "\C-x\C-m" 'execute-extended-command)


;;; Handle SGR control sequences in output. Allows colored text from e.g. a unix
;;; command.
(ansi-color-for-comint-mode-on)

;;; Intelligent buffer renaming
(require 'uniquify)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*") ; ignore special buffers
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(require 'delsel)

;;; Paredit
(require 'paredit)
(dolist (hook '(scheme-mode-hook
                emacs-lisp-mode-hook
                lisp-mode-hook))
  (add-hook hook 'enable-paredit-mode))


;;; Javascript
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
(setq espresso-indent-level 2)

;;; Load textile-mode on textile files.
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;;; Auto-Fill for these modes.
(dolist (hook '(text-mode-hook
                tuareg-mode-hook
                scheme-mode-hook))
  (add-hook hook 'turn-on-auto-fill))


(add-to-list 'load-path "~/.emacs.d/site/emacs-for-python/") ;; tell where to load he various files
(require 'epy-init)
(epy-setup-ipython)
(epy-setup-checker "pyflakes %f")
(add-to-list 'auto-mode-alist '("\\.tac$" . python-mode))


(load-file "~/.emacs.d/site/s.el/s.el")
(add-to-list 'load-path "~/.emacs.d/site/multiple-cursors.el/")
(add-to-list 'load-path "~/.emacs.d/site/mark-multiple.el")
(add-to-list 'load-path "~/.emacs.d/site/expand-region.el")
(add-to-list 'load-path "~/.emacs.d/site/zencoding")

(require 'zencoding-mode)
(require 'expand-region)
;; (require 'multiple-cursors)
(require 'inline-string-rectangle)
(require 'mark-more-like-this)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(delete-selection-mode 1)
(add-hook 'sgml-mode-hook 'zencoding-mode)


;;; custom lib
(mapcar (lambda (file)  (load-file (concat "~/.emacs.d/site/custom/" file)))
        (list  "dict.el"  "coding.el" "tools.el" "display.el"))

(mapcar (lambda (file)  (load-file (concat "~/.emacs.d/site/custom/defuns/" file))) (cddr (directory-files "~/.emacs.d/site/custom/defuns")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories (quote ("/home/sosowang/github/lab/mqtts" "/home/sosowang/lab/edeproject/include" "/home/sosowang/lab/edeproject/src" "/home/sosowang/lab/edeproject")))

 '(w3m-key-binding (quote info)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-load-path "w3m")
(require 'w3m)



(add-load-path "color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)
(load-file "~/.emacs.d/site/graphviz-dot-mode.el")
(add-hook 'find-file-hook (lambda()
                            (if (string= "dot" (file-name-extension
                                                buffer-file-name))
                                (progn
                                  (message "Enabling Setings for dot-mode")
                                  (setq fill-column 1000)
                                  (base-auto-pair)
                                  (local-set-key (kbd "<C-f6>") 'compile)
                                  )
                              )))
(put 'set-goal-column 'disabled nil)


(add-to-list 'auto-mode-alist '("\\.stp\\'" . systemtap-mode))
(add-to-list 'auto-mode-alist '("\\.stpm\\'" . systemtap-mode))
(autoload 'systemtap-mode "systemtap-mode.el")
(require 'yasnippet)


;;; auto complete
(add-to-list 'load-path "~/.emacs/site/auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs/site/auto-complete")
(ac-config-default)

;;; nasm
(autoload 'nasm-mode "~/.emacs.d/nasm-mode.el" "" t)
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))

;;; golang
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))
