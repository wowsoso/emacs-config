;;;weibo
(add-load-path "weibo.emacs")
(require 'weibo)


(push "~/.emacs.d/site/org-toodledo" load-path)
(require 'org-toodledo)
(setq org-toodledo-userid "td51586a0210beb")
;(setq org-toodledo-password "<toodled-password>")

;; Useful key bindings for org-mode
(add-hook 'org-mode-hook
       (lambda ()
         (local-unset-key "\C-o")
         (local-set-key "\C-od" 'org-toodledo-mark-task-deleted)
         (local-set-key "\C-os" 'org-toodledo-sync)
         )
       )
(add-hook 'org-agenda-mode-hook
       (lambda ()
         (local-unset-key "\C-o")
         (local-set-key "\C-od" 'org-toodledo-agenda-mark-task-deleted)
         )
       )

(autoload 'wikipedia-mode "wikipedia-mode.el"
"Major mode for editing documents in Wikipedia markup." t)
(add-to-list 'auto-mode-alist
'("\\.wiki\\'" . wikipedia-mode))
(setq text-mode-hook (quote (#[nil "\300\301!\207" [flyspell-mode 1] 2] flyspell-buffer text-mode-hook-identify)))
(autoload 'longlines-mode "longlines.el"
"Minor mode for editing long lines." t)
(add-to-list 'auto-mode-alist '("index.\\.*" . wikipedia-mode))
(add-to-list 'auto-mode-alist '("\\.wikipedia\\.org.*\\.txt\\'" . wikipedia-mode))
