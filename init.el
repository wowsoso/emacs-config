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

(require 'delsel)

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

;; ;;; Global color theme stuff.
;; (require 'color-theme)

;; ;;; Tango color theme.
;; (autoload 'color-theme-tango "color-theme-tango"
;;   "Tango color theme for emacs"
;;   t)
;; (color-theme-tango)

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

;(load-file "~/.emacs.d/site/multi-shell.el")
;(require 'multi-shell)
;(global-set-key (kbd "C-;") 'multi-shell-prev)
;(global-set-key (kbd "C-'") 'multi-shell-next)
;(global-set-key  [C-return] 'multi-shell-current-directory)
;(global-set-key  [C-M-return] 'multi-shell-new)

(add-to-list 'load-path "~/.emacs.d/site/newsticker/")
(autoload 'newsticker-start "newsticker" "Emacs Newsticker" t)
(autoload 'newsticker-show-news "newsticker" "Emacs Newsticker" t)

(load-file "~/.emacs.d/site/s.el/s.el")
(add-to-list 'load-path "~/.emacs.d/site/multiple-cursors.el/")
(add-to-list 'load-path "~/.emacs.d/site/mark-multiple.el")
(add-to-list 'load-path "~/.emacs.d/site/expand-region.el")
(add-to-list 'load-path "~/.emacs.d/site/zencoding")

(require 'zencoding-mode)
(require 'expand-region)
(require 'multiple-cursors)
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


(require 'ibus)
;; Turn on ibus-mode automatically after loading .emacs
(add-hook 'after-init-hook 'ibus-mode-on)
;; Use C-SPC for Set Mark command
(ibus-define-common-key ?\C-\s nil)
;; Use C-/ for Undo command
(ibus-define-common-key ?\C-/ nil)
;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("red" "blue" "limegreen"))
;; Use S-SPC to toggle input status
(ibus-define-common-key ?\S-\s nil)
(global-set-key (kbd "S-SPC") 'ibus-toggle)

(require 'irfc)

(when (locate-library "edit-server")
  (require 'edit-server)
  (setq edit-server-new-frame nil)
  (edit-server-start))

;;; custom lib
(mapcar (lambda (file)  (load-file (concat "~/.emacs.d/site/custom/" file)))
        (list  "dict.el"  "coding.el" "tools.el" "gnus.el" "org.el" "display.el"))

(mapcar (lambda (file)  (load-file (concat "~/.emacs.d/site/custom/defuns/" file))) (cddr (directory-files "~/.emacs.d/site/custom/defuns")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories (quote ("/home/sosowang/lab/edeproject/include" "/home/sosowang/lab/edeproject/src" "/home/sosowang/lab/edeproject")))
 '(newsticker-url-list (quote (("base" "http://www.linux.org/feeds/rss/1" nil nil nil) ("hardware" "http://www.linux.org/feeds/rss/2" nil nil nil) ("installation" "http://www.linux.org/feeds/rss/3" nil nil nil) ("tips" "http://www.linux.org/feeds/rss/4" nil nil nil) ("other" "http://www.linux.org/feeds/rss/5" nil nil nil) ("networking" "http://www.linux.org/feeds/rss/6" nil nil nil) ("security" "http://www.linux.org/feeds/rss/7" nil nil nil) ("servers" "http://www.linux.org/feeds/rss/8" nil nil nil) ("shell" "http://www.linux.org/feeds/rss/9" nil nil nil) ("desktop" "http://www.linux.org/feeds/rss/10" nil nil nil) ("linux" "www.ibm.com/developerworks/views/linux/rss/libraryview.jsp" nil nil nil) ("cloud" "http://www.ibm.com/developerworks/views/cloud/rss/libraryview.jsp" nil nil nil))))
 '(w3m-key-binding (quote info)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-load-path "w3m")
(require 'w3m)



(require 'tramp)

(add-load-path "color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-infodoc)
