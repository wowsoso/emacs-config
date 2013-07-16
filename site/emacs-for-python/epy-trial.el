(require 'trial)

;; Nose bindings
(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key "\C-ct" 'run-trial-defualt)
	    (local-set-key "\C-cT" 'run-trial-current-file)
)
	  )


(provide 'epy-trial)
