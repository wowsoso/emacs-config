;;;_* sage.el --- Major modes for editing sage code, interacting with inferior
;;;sage processes, building sage, and doctesting sage

;; Copyright (C) 2007, 2008  Nick Alexander

;; Author: Nick Alexander <ncalexander@gmail.com>
;; Keywords: sage ipython python math

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; `sage-mode' is a major mode for editing sage (and python, and cython)
;; source code.  `inferior-sage-mode' is the companion mode for interacting
;; with a slave sage session.  See the help for `sage-mode' for help getting
;; started and the default key bindings.

;; sage.el provides customization options and autoloads.

;;; Code:

(load "sage-load" t)

(defconst sage-mode-version "0.8"
  "Version of `sage-mode'.")

(defcustom inferior-sage-prompt (rx line-start (1+ (and (or "sage:" ">>>" "....." "..." "(Pdb)" "ipdb>" "(gdb)") " ")))
  "Regular expression matching the SAGE prompt."
  :group 'sage
  :type 'regexp)

(defcustom inferior-sage-timeout 500000
  "*How long to wait for a SAGE prompt at startup."
  :group 'sage
  :type 'integer)

(eval-when-compile (require 'cl))
(defun sage-guess-command ()
  "Tries to guess what value to use for `sage-command'.
It uses sage in PATH if it can find it, otherwise on OS X it
attempts to find and use Sage.app.  It falls back to ~/bin/sage."
  (car (split-string
        (flet ((nill-if-empty (s) (and (> (length s) 2) s)))
          (or (nill-if-empty (shell-command-to-string "which sage 2>/dev/null"))
              (and (eq system-type 'darwin)
                   (nill-if-empty
                    (shell-command-to-string
                     (concat "osascript -e 'tell app \"Finder\" to "
                             "POSIX path of "
                             "(application file id \"org.sagemath.Sage\" as alias) "
                             "& \"Contents/Resources/sage/sage\"' 2>/dev/null "))))
              (expand-file-name "~/bin/sage")))
        "\n")))

(defcustom sage-command (sage-guess-command)
  "*Actual command used to run sage.
Additional arguments are added when the command is used by `run-sage' et al."
  :group 'sage
  :type 'string)

(defcustom sage-quit-debugger-automatically t
  "*Quit debugger automatically before sending a docstring, region or buffer to the sage slave."
  :group 'sage
  :type 'bool)

(defcustom sage-startup-before-prompt-command "%colors NoColor"
  "*Send this command to the sage slave each time it is executed by `run-sage', BEFORE the first prompt is seen."
  :group 'sage
  :type 'string)

(defcustom sage-startup-after-prompt-command nil
  "*Send this command to the sage slave each time it is executed by `run-sage', AFTER the first prompt is seen."
  :group 'sage
  :type 'string)

(defun sage-send-startup-before-prompt-command ()
  (sage-send-command sage-startup-before-prompt-command nil))

(defun sage-send-startup-after-prompt-command ()
  (sage-send-command "" t)
  (accept-process-output nil 0 1) ;; make sure the prompt appears between inputs
  (when sage-startup-after-prompt-command
    (sage-send-command sage-startup-after-prompt-command t)))

(defcustom sage-startup-before-prompt-hook (list 'sage-send-startup-before-prompt-command)
  "*Normal hook (list of functions) run after `sage' is run but BEFORE the first prompt is seen.
See `sage-startup-after-prompt-hook' and `run-hooks'."
  :group 'sage
  :type 'hook)

;; (add-hook 'sage-startup-after-prompt-hook 'sage-send-startup-after-prompt-command)
(defcustom sage-startup-after-prompt-hook nil
  "*Normal hook (list of functions) run after `sage' is run and AFTER the first prompt is seen.
See `sage-startup-before-prompt-hook' and `run-hooks'."
  :group 'sage
  :type 'hook)

(defun sage-default-after-help-function ()
  "Make it easy to run doctests in help buffers."
  (local-set-key [(control c) (control r)] 'sage-send-region)
  (local-set-key [(control c) (control j)] 'sage-send-doctest))

(defcustom sage-after-help-hook (list 'sage-default-after-help-function)
  "List of hook functions run after a sage help buffer is displayed. (see `run-hooks')."
  :type 'hook
  :group 'sage)

(defgroup sage-test nil "Run Sage doctests"
  :group 'sage
  :prefix "sage-test-"
  :link '(url-link :tag "Homepage" "http://wiki.sagemath.org/sage-mode"))

(defcustom sage-test-setup-hook nil
  "List of hook functions run by `sage-test-process-setup' (see `run-hooks')."
  :type 'hook
  :group 'sage-test)

;; the -, + is for diff-mode
(defcustom sage-test-prompt (rx line-start (? (or "-" "+")) (0+ (or space punct)) (1+ (or "sage: " ">>> ")))
  "Regular expression matching the SAGE prompt of a single doctest line."
  :group 'sage-test
  :type 'regexp)

(defgroup sage-build nil "Build the Sage library"
  :group 'sage
  :prefix "sage-build-"
  :link '(url-link :tag "Homepage" "http://wiki.sagemath.org/sage-mode"))

(defcustom sage-build-setup-hook nil
  "List of hook functions run by `sage-build-process-setup' (see `run-hooks')."
  :type 'hook
  :group 'sage-build)

(defcustom sage-rerun-command (format "%s" sage-command)
  "Actual command used to rerun SAGE.
Additional arguments are added when the command is used by `rerun-sage' et al."
  :group 'sage-build
  :type 'string)

(defgroup sage-view nil "Typeset Sage output on the fly"
  :group 'sage
  :prefix "sage-view-"
  :link '(url-link :tag "Homepage" "http://wiki.sagemath.org/sage-mode"))

(defcustom sage-view-gs-command (if (eq system-type 'windows-nt)
				    "GSWIN32C.EXE"
				  "gs")
  "*Ghostscript command to convert from PDF to PNG.

See also `sage-view-gs-options', `sage-view-anti-aliasing-level'
and `sage-view-scale'."
  :type 'string
  :group 'sage-view)

(defcustom sage-view-gs-options
  '("-sDEVICE=png16m" "-dBATCH" "-dSAFER" "-q" "-dNOPAUSE")
  "*Options for Ghostscript when converting from PDF to PNG."
  :type 'list
  :group 'sage-view)

(defcustom sage-view-anti-aliasing-level 2
  "*Level of anti-aliasing used when converting from PDF to PNG. "
  :type 'integer
  :group 'sage-view)

(defcustom sage-view-scale 1.2
  "*Scale used when converting from PDF/PS to PNG."
  :type 'number
  :group 'sage-view)

(defcustom sage-view-margin '(1 . 1)
  "*Margin (in pixels or (pixels-x . pixels-y)) added around displayed images."
  :type '(choice integer (cons integer integer))
  :group 'sage-view)

(defcustom sage-view-scale-factor 0.2
  "*Factor used when zooming."
  :type 'number
  :group 'sage-view)

;; If not being loaded, we must be evaluating it from within this file
(defvar sage-autoloads-location
  (file-name-directory
   (or load-file-name
       (buffer-file-name)))
  "Directory where autoloads should come from and be created.")

;; Generate autoload for sage elisp files
(defun sage-update-autoloads nil
  "Generate autoloads for sage elisp files.

WARNING: do not use this unless you are distributing a new
version of `sage-mode'!"
  (interactive)
  (let ((generated-autoload-file (concat sage-autoloads-location "sage-load.el")))
    (update-directory-autoloads sage-autoloads-location)))

(provide 'sage)
