;;; Add the site directory to load path.
(defvar *roderic-site-dir* (expand-file-name "~/.emacs.d/site/"))
(add-to-list 'load-path *roderic-site-dir*)

(defun add-load-path (path)
  (add-to-list 'load-path (concat *roderic-site-dir* path)))


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

;;; Paredit
(require 'paredit)
(dolist (hook '(scheme-mode-hook
                emacs-lisp-mode-hook
                lisp-mode-hook))
  (add-hook hook 'enable-paredit-mode))

;;; Scheme48
(autoload 'scheme48-mode "scheme48"
  "Major mode for editing scheme with scheme48." t)


;;; Coffee script.
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

;;; Javascript
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
(setq espresso-indent-level 2)

;;; Load textile-mode on textile files.
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;;; Global color theme stuff.
(require 'color-theme)

;;; Tango color theme.
(autoload 'color-theme-tango "color-theme-tango"
  "Tango color theme for emacs"
  t)
(color-theme-tango)

;;; Auto-Fill for these modes.
(dolist (hook '(text-mode-hook
                tuareg-mode-hook
                scheme-mode-hook))
  (add-hook hook 'turn-on-auto-fill))


(add-to-list 'load-path "~/.emacs.d/site/emacs-for-python/") ;; tell where to load the various files
(require 'epy-init)
(epy-setup-ipython)
(epy-setup-checker "pyflakes %f")


(load-file "~/.emacs.d/site/multi-shell.el")
(require 'multi-shell)
(global-set-key (kbd "C-;") 'multi-shell-prev)
(global-set-key (kbd "C-'") 'multi-shell-next)
(global-set-key  [C-return] 'multi-shell-current-directory)
(global-set-key  [C-M-return] 'multi-shell-new)

    `multi-shell-new'                create a new shell buffer.
     `multi-shell-next'               switch to next shell buffer.
     `multi-shell-prev'               switch to previous shell buffer.
     `multi-shell-current-directory'  create a new shell with current-dir


;;; custom lib
(mapcar (lambda (file)  (load-file (concat "~/.emacs.d/site/custom/" file)))
        (list  "dict.el"  "coding.el" "tools.el" "gnus.el" "org.el" "display.el"))
