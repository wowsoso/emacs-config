(setq auto-save-default nil)
(add-hook 'python-mode-hook 'turn-on-orgstruct++)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;lambda mode
(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))
;;; Insert a ¦Ë.
(global-set-key "\C-x/" '(lambda () (interactive) (insert #x3bb)))


;;;pep8 & pylint
(require 'python-pep8)
(require 'python-pylint)


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


;;;magit
(add-load-path "magit")
(require 'magit)
(require 'magit-blame)
(define-prefix-command 'ctl-,-map)
(global-set-key (kbd "C-,") 'ctl-,-map)
(define-key ctl-,-map (kbd "gst") 'magit-status)
