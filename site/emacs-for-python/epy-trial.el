(require 'trial)

;; Nose bindings
(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key "\C-ct" 'run-trial-current-file)
	    (local-set-key "\C-cT" 'run-trial-defualt)
)
	  )


(provide 'epy-trial)
