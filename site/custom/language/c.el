(global-font-lock-mode t)


(load-file "~/.emacs.d/site/cedet/cedet-devel-load.el")

;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)

;; Enable Semantic
(semantic-mode 1)

;; Enable EDE (Project Management) features
(global-ede-mode 1)


(srecode-minor-mode 1)
;(set srecode-map-load-path "~/site/cede")

(global-cedet-m3-minor-mode 1)
(define-key cedet-m3-mode-map "\C-c " 'cedet-m3-menu-kbd)

(semantic-load-enable-minimum-features)
(semantic-load-enable-all-exuberent-ctags-support)
(semantic-load-enable-code-helpers)
(semantic-load-enable-code-helpers)
(semantic-load-enable-gaudy-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)


(setq-mode-local c-mode
                 semanticdb-find-default-throttle
                 '(project unloaded recursive))

;; Increase the delay before activation
(setq semantic-idle-scheduler-idle-time 10)
;; Don't reparse really big buffers.
(setq semantic-idle-scheduler-max-buffer-size 100000)


(add-hook 'speedbar-load-hook (lambda () (require 'semantic/sb)))
(add-hook 'semantic-init-hooks (lambda () (imenu-add-to-menubar "TAGS")))

(setq c-default-style "k&r"
          c-basic-offset 4)


(require 'xcscope)
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]
  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]  'cscope-display-buffer)
(define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)
