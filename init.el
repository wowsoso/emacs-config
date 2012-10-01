;;; OS level copy / paste
(setq x-select-enable-clipboard t)

(setq make-backup-files nil)

;;; Add the site directory to load path.
(defvar *roderic-site-dir* (expand-file-name "~/.emacs.d/site/"))
(add-to-list 'load-path *roderic-site-dir*)

(defun add-load-path (path)
  (add-to-list 'load-path (concat *roderic-site-dir* path)))

;;; Show column numbers in the mode line.
(column-number-mode t)

;;; Highlight open and close parenthesis when the point is on them.
(show-paren-mode t)

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

;;; Insert a λ.
(global-set-key "\C-x/" '(lambda () (interactive) (insert #x3bb)))

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
(require 'epy-setup)      ;; It will setup other loads, it is required!
(require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
(require 'epy-bindings)   ;; For my suggested keybindings [optional]
(require 'epy-nose)       ;; For nose integration



;; ;;;python mode
;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; ;;;pymacs
;; (require 'pymacs)

;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; ;;;ipython
;; (setq ipython-command "/usr/bin/ipython")
;; (require 'ipython)

;; ;;;lambda mode
;; (require 'lambda-mode)
;; (add-hook 'python-mode-hook #'lambda-mode 1)
;; (setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))

;; ;;;anything
;; (require 'anything)
;; (require 'anything-ipython)
;; (when (require 'anything-show-completion nil t)
;;   (use-anything-show-completion 'anything-ipython-complete
;;                                 '(length initial-pattern)))

;; ;;;pep8 & pylint
;; (require 'python-pep8)
;; (require 'python-pylint)

;;;autopair
(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode)
(dolist (hook '(scheme-mode-hook
                emacs-lisp-mode-hook
                python-lisp-mode-hook
                lisp-mode-hook))
  (add-hook hook #'(lambda () (setq autopair-dont-activate t))))

;; ;;;yasnippet
;; (require 'yasnippet-bundle)
;; (require 'yasnippet)
;;;magit
(add-load-path "magit")
(require 'magit)
(require 'magit-blame)

(define-prefix-command 'ctl-,-map)
(global-set-key (kbd "C-,") 'ctl-,-map)
(define-key ctl-,-map (kbd "gst") 'magit-status)

;;;weibo
(add-load-path "weibo.emacs")
(require 'weibo)


;;;ibus
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

;;w3m
(require 'w3m-load)

;; sawfish mode settings
;; load the first sawfish.el or sawfish.elc file found in the load-path
(autoload 'sawfish-mode "sawfish" "sawfish-mode" t)
;; this tells emacs to automatically activate the sawfish-mode whenever open
;; file with "sawfishrc" or "jl" (John Lisp) suffix
(add-to-list 'auto-mode-alist '(".*sawfishrc\\'" . sawfish-mode ))
(add-to-list 'auto-mode-alist '(".sawfish/rc\\'" . sawfish-mode ))
(add-to-list 'auto-mode-alist '(".*\\.jl\\'" . sawfish-mode ))
;; if you're using ECB, tells to use the compilation buffer to show long
;; sawfish messages


;;; custom lib
(mapcar (lambda (file)  (load-file (concat "~/.emacs.d/site/custom/" file)))
        (list "screen.el" "dict.el"  "coding.el" "languages.el"))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(w3m-key-binding (quote info)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
