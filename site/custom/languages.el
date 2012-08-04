;;;
;;; python config
;;;
(add-hook 'python-mode-hook 'turn-on-orgstruct++)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
