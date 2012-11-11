(setq gnus-select-method '(nntp "news.somewhere.edu"))
(setq gnus-secondary-select-methods '((nnmbox "")))

(defun turn-off-backup ()
  (set (make-local-variable 'backup-inhibited) t))

(add-hook 'gnus-save-quick-newsrc-hook 'turn-off-backup)
(add-hook 'gnus-save-standard-newsrc-hook 'turn-off-backup)


;; (setq gnus-ignored-newsgroups "")

;; ;; And this to configure gmail imap

;; (setq gnus-select-method '(nnimap "gmail"
;; (nnimap-address "imap.gmail.com")
;; (nnimap-server-port 993)
;; (nnimap-stream ssl)
;; ))

;; ;; My version of gnus in my Mac does not handle html messages
;; ;; correctly (the one in the netbook does, I guess it is a different
;; ;; version). The following will chose plaintext every time this is
;; ;; possible.

;; (setq mm-discouraged-alternatives '("text/html" "text/richtext"))

;; ;; Available SMTP accounts. The format is
;; ;; type of connection - account in the from field - smtp server -
;; ;; port - login name - password. You can leave the password field
;; ;; as NIL and emacs will ask every time

;; (defvar smtp-accounts
;; '(
;; (ssl "wowsososo@gmail.com" "smtp.gmail.com"
;; 587 "wowsososo@gmail.com")
;;  ))

;; ;; Now lets configure smtpmail.el with your name and functions to send
;; ;; mail using your smtp accounts by changing the from field

;; (require 'smtpmail)
;; (setq send-mail-function 'smtpmail-send-it
;; message-send-mail-function 'smtpmail-send-it
;; mail-from-style nil user-full-name "Qi Wang"
;; smtpmail-debug-info t smtpmail-debug-verb t)

;; (defun set-smtp (mech server port user password)
;; "Set related SMTP variables for supplied parameters."
;; (setq smtpmail-smtp-server server smtpmail-smtp-service port
;; smtpmail-auth-credentials (list (list server port user
;; password)) smtpmail-auth-supported (list mech)
;; smtpmail-starttls-credentials nil)
;; (message "Setting SMTP server to `%s:%s' for user `%s'."
;; server port user))

;; (defun set-smtp-ssl (server port user password &optional key
;;             cert)
;; "Set related SMTP and SSL variables for supplied parameters."
;; (setq starttls-use-gnutls t
;; starttls-gnutls-program "gnutls-cli"
;; starttls-extra-arguments nil smtpmail-smtp-server server
;; smtpmail-smtp-service port
;; smtpmail-auth-credentials (list (list server port user
;; password)) smtpmail-starttls-credentials (list (list
;; server port key cert)))
;; (message
;; "Setting SMTP server to `%s:%s' for user `%s'. (SSL
;; enabled.)" server port user))

;; (defun change-smtp ()
;; "Change the SMTP server according to the current from line."
;; (save-excursion
;; (loop with from = (save-restriction
;;         (message-narrow-to-headers)
;;         (message-fetch-field "from"))
;; for (auth-mech address . auth-spec) in smtp-accounts
;; when (string-match address from) do (cond
;; ((memq auth-mech '(cram-md5 plain login))
;; (return (apply 'set-smtp (cons auth-mech auth-spec))))
;; ((eql auth-mech 'ssl)
;; (return (apply 'set-smtp-ssl auth-spec)))
;; (t (error "Unrecognized SMTP auth. mechanism:
;; `%s'." auth-mech))) finally (error "Cannot infer SMTP
;; information."))))

;; ;; The previous function will complain if you fill the from field with
;; ;; an account not present in smtp-accounts.

;; (defvar %smtpmail-via-smtp (symbol-function 'smtpmail-via-smtp))

;; (defun smtpmail-via-smtp (recipient smtpmail-text-buffer)
;; (with-current-buffer smtpmail-text-buffer
;; (change-smtp))
;; (funcall (symbol-value '%smtpmail-via-smtp) recipient
;; smtpmail-text-buffer))




;; (set-language-environment 'Chinese-GB)
;; (setq gnus-default-charset 'chinese-iso-8bit
;;       gnus-group-name-charset-group-alist '((".*" . utf-8))
;;       gnus-summary-show-article-charset-alist
;;       '((1 . cn-gb-2312)
;;     (2 . gb18030)
;;     (3 . chinese-iso-8bit)
;;     (4 . gbk)
;;     (5 . big5)
;;     (6 . utf-8))
;;       gnus-newsgroup-ignored-charsets
;;       '(unknown-8bit x-unknown iso-8859-1))

;; (setq gnus-newsgroup-ignored-charsets
;;      '(unknown-8bit x-unknown gb18030))
;; (setq mm-coding-system-priorities '(iso-8859-1 chinese-iso-8bit utf-8))

;; ;;;;;;;;;;;;;;;;;;;;
;; ;;自动显示图片
;; ;;;;;;;;;;;;;;;;;;;;
;; (auto-image-file-mode)
;; (setq mm-inline-large-images t)
;; ;(add-to-list 'mm-attachment-override-types "image/*")