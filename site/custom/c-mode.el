(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)

(global-semantic-highlight-edits-mode (if window-system 1 -1))
(global-semantic-show-unmatched-syntax-mode 1)
(global-semantic-show-parser-state-mode 1)

(defconst user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst win32-include-dirs
  (list "C:/MinGW/include"
        "C:/MinGW/include/c++/3.4.5"
        "C:/MinGW/include/c++/3.4.5/mingw32"
        "C:/MinGW/include/c++/3.4.5/backward"
        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
(let ((include-dirs user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

(require 'semantic/analyze/refs)

(defadvice push-mark (around semantic-mru-bookmark activate)
  "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
If `semantic-mru-bookmark-mode' is active, also push a tag onto
the mru bookmark stack."
  (semantic-mrub-push semantic-mru-bookmark-ring
                      (point)
                      'mark)
  ad-do-it)

(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
         (alist (semantic-mrub-ring-to-assoc-list ring))
         (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
        (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))

(defun semantic-ia-fast-jump-or-back (&optional back)
  (interactive "P")
  (if back
      (semantic-ia-fast-jump-back)
    (semantic-ia-fast-jump (point))))
(define-key semantic-mode-map [f6] 'semantic-ia-fast-jump-or-back)
(define-key semantic-mode-map [C-f6] 'semantic-ia-fast-jump-or-back)
(define-key semantic-mode-map [S-f6] 'semantic-ia-fast-jump-back)

(define-key semantic-mode-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)

(setq pulse-command-advice-flag (if window-system 1 nil))

(defadvice goto-line (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(defadvice exchange-point-and-mark (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p)
             (> (abs (- (point) (mark))) 400))
    (pulse-momentary-highlight-one-line (point))))

(defadvice find-tag (after pulse-advice activate)
  "After going to a tag, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(defadvice tags-search (after pulse-advice activate)
  "After going to a hit, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(defadvice tags-loop-continue (after pulse-advice activate)
  "After going to a hit, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(defadvice pop-tag-mark (after pulse-advice activate)
  "After going to a hit, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(defadvice imenu-default-goto-function (after pulse-advice activate)
  "After going to a tag, pulse the line the cursor lands on."
  (when pulse-command-advice-flag
    (pulse-momentary-highlight-one-line (point))))

(defadvice cua-exchange-point-and-mark (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p)
             (> (abs (- (point) (mark))) 400))
    (pulse-momentary-highlight-one-line (point))))

(defadvice switch-to-buffer (after pulse-advice activate)
  "After switch-to-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(defadvice previous-buffer (after pulse-advice activate)
  "After previous-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(defadvice next-buffer (after pulse-advice activate)
  "After next-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(defadvice ido-switch-buffer (after pulse-advice activate)
  "After ido-switch-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(defadvice beginning-of-buffer (after pulse-advice activate)
  "After beginning-of-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(add-hook  'c-mode-common-hook (lambda()                                  
    (c-set-style "k&r")
    (setq c-basic-offset 4)
))