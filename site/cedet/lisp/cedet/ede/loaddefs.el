;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ede-project-sort-targets ede-customize-current-target
;;;;;;  ede-customize-project) "ede/custom" "custom.el" "20974d0342ed403b35f864b8a3ff4ea6")
;;; Generated autoloads from custom.el

(autoload 'ede-customize-project "ede/custom" "\
Edit fields of the current project through EIEIO & Custom.

\(fn)" t nil)

(defalias 'customize-project 'ede-customize-project)

(autoload 'ede-customize-current-target "ede/custom" "\
Edit fields of the current target through EIEIO & Custom.

\(fn)" t nil)

(defalias 'customize-target 'ede-customize-current-target)

(autoload 'ede-project-sort-targets "ede/custom" "\
Create a custom-like buffer for sorting targets of current project.

\(fn)" t nil)

;;;***

;;;### (autoloads (ede-cpp-root-project-root) "ede/cpp-root" "cpp-root.el"
;;;;;;  "e2056aa3d63d78a975ca42ca3c7cd230")
;;; Generated autoloads from cpp-root.el

(autoload 'ede-cpp-root-project-root "ede/cpp-root" "\
Get the root directory for DIR.

\(fn &optional DIR)" nil nil)

(ede-add-project-autoload (ede-project-autoload "cpp-root" :name "CPP ROOT" :file 'ede-cpp-root :proj-file 'ede-cpp-root-project-file-for-dir :proj-root 'ede-cpp-root-project-root :load-type 'ede-cpp-root-load :class-sym 'ede-cpp-root :new-p nil :safe-p t) 'unique)

;;;***

;;;### (autoloads (ede-arduino-load ede-arduino-file ede-arduino-root)
;;;;;;  "ede/arduino" "arduino.el" "c55677516b51516b47cd29e802c66dcf")
;;; Generated autoloads from arduino.el

(autoload 'ede-arduino-root "ede/arduino" "\
Get the root project directory for DIR.
The only arduino sketches allowed are those configured by the arduino IDE
in their sketch directory.

If BASEFILE is non-nil, then convert root to the project basename also.

Consider expanding this at some later date.

\(fn &optional DIR BASEFILE)" nil nil)

(autoload 'ede-arduino-file "ede/arduino" "\
Get a file representing the root of this arduino project.
It is a file ending in .pde or .ino that has the same basename as
the directory it is in.  Optional argument DIR is the directory
to check.

\(fn &optional DIR)" nil nil)

(autoload 'ede-arduino-load "ede/arduino" "\
Return an Arduino project object if there is one.
Return nil if there isn't one.
Argument DIR is the directory it is created for.
ROOTPROJ is nil, sinc there is only one project for a directory tree.

\(fn DIR &optional ROOTPROJ)" nil nil)

(add-to-list 'ede-project-class-files (ede-project-autoload "arduino" :name "ARDUINO SKETCH" :file 'ede/arduino :proj-root-dirmatch (ede-project-autoload-dirmatch "arduino" :fromconfig "~/.arduino/preferences.txt" :configregex "^sketchbook.path=\\([^\n]+\\)$" :configregexidx 1) :proj-file 'ede-arduino-file :proj-root 'ede-arduino-root :load-type 'ede-arduino-load :class-sym 'ede-arduino-project :safe-p t :new-p t) t)

;;;***

;;;### (autoloads (ede-android-project ede-android-load) "ede/android"
;;;;;;  "android.el" "db5d948656a2b86c0af0ba82eec5ecfb")
;;; Generated autoloads from android.el

(autoload 'ede-android-load "ede/android" "\
Return an Android Project object if there is a match.
Return nil if there isn't one.
Argument DIR is the directory it is created for.
ROOTPROJ is nil, since there is only one project.

\(fn DIR &optional ROOTPROJ)" nil nil)

(ede-add-project-autoload (ede-project-autoload "android" :name "ANDROID ROOT" :file 'ede/android :proj-file "AndroidManifest.xml" :load-type 'ede-android-load :class-sym 'ede-android-project :new-p t :safe-p t))

(eieio-defclass-autoload 'ede-android-project '(ede-project eieio-instance-tracker) "ede/android" "Project for Android applications.")

;;;***

;;;### (autoloads (ede-emacs-project-root) "ede/emacs" "emacs.el"
;;;;;;  "3d14ccb9826cba886783832675c4c6cb")
;;; Generated autoloads from emacs.el

(autoload 'ede-emacs-project-root "ede/emacs" "\
Get the root directory for DIR.

\(fn &optional DIR)" nil nil)

(ede-add-project-autoload (ede-project-autoload "emacs" :name "EMACS ROOT" :file 'ede/emacs :proj-file "src/emacs.c" :proj-root-dirmatch "emacs[^/]*" :proj-root 'ede-emacs-project-root :load-type 'ede-emacs-load :class-sym 'ede-emacs-project :new-p nil :safe-p t) 'unique)

;;;***

;;;### (autoloads (ede-find-file) "ede/files" "files.el" "41dc5672e26187c6881df0ae085e7444")
;;; Generated autoloads from files.el

(autoload 'ede-find-file "ede/files" "\
Find FILE in project.  FILE can be specified without a directory.
There is no completion at the prompt.  FILE is searched for within
the current EDE project.

\(fn FILE)" t nil)

;;;***

;;;### (autoloads (ede-enable-generic-projects) "ede/generic" "generic.el"
;;;;;;  "267b9aa69500830f20746215e1ce5cbb")
;;; Generated autoloads from generic.el

(autoload 'ede-enable-generic-projects "ede/generic" "\
Enable generic project loaders.

\(fn)" t nil)

;;;***

;;;### (autoloads (ede-java-root-project-root) "ede/java-root" "java-root.el"
;;;;;;  "a940557b19bbe624e5044ca2f96155eb")
;;; Generated autoloads from java-root.el

(autoload 'ede-java-root-project-root "ede/java-root" "\
Get the root directory for DIR.

\(fn &optional DIR)" nil nil)

(ede-add-project-autoload (ede-project-autoload "java-root" :name "JAVA ROOT" :file 'ede-java-root :proj-file 'ede-java-root-project-file-for-dir :proj-root 'ede-java-root-project-root :load-type 'ede-java-root-load :class-sym 'ede-java-root :new-p nil :safe-p t) 'unique)

;;;***

;;;### (autoloads (ede-linux-load ede-linux-project-root) "ede/linux"
;;;;;;  "linux.el" "25005add68c5dab96b228a09e899e2d0")
;;; Generated autoloads from linux.el

(autoload 'ede-linux-project-root "ede/linux" "\
Get the root directory for DIR.

\(fn &optional DIR)" nil nil)

(autoload 'ede-linux-load "ede/linux" "\
Return an Linux Project object if there is a match.
Return nil if there isn't one.
Argument DIR is the directory it is created for.
ROOTPROJ is nil, since there is only one project.

\(fn DIR &optional ROOTPROJ)" nil nil)

(ede-add-project-autoload (ede-project-autoload "linux" :name "LINUX ROOT" :file 'ede/linux :proj-file "scripts/ver_linux" :proj-root-dirmatch "linux[^/]*" :proj-root 'ede-linux-project-root :load-type 'ede-linux-load :class-sym 'ede-linux-project :new-p nil :safe-p t) 'unique)

;;;***

;;;### (autoloads (ede-enable-locate-on-project) "ede/locate" "locate.el"
;;;;;;  "ae42dde0e1d8d2c00db0e1ca37f944d5")
;;; Generated autoloads from locate.el

(autoload 'ede-enable-locate-on-project "ede/locate" "\
Enable an EDE locate feature on PROJECT.
Attempt to guess which project locate style to use
based on `ede-locate-setup-options'.

\(fn &optional PROJECT)" t nil)

;;;***

;;;### (autoloads (ede-m3-install) "ede/m3" "m3.el" "8c66b690945b4e5f69c8f9d074deec01")
;;; Generated autoloads from m3.el

(autoload 'ede-m3-install "ede/m3" "\
Not documented

\(fn)" nil nil)

;;;***

;;;### (autoloads (ede-make-check-version) "ede/make" "make.el" "4e8f948c96e8cdffd68c90843b6d7f99")
;;; Generated autoloads from make.el

(autoload 'ede-make-check-version "ede/make" "\
Check the version of GNU Make installed.
The check passes if the MAKE version is no high enough, or if it
is not GNU make.
If NOERROR is non-nil, return t for success, nil for failure.
If NOERROR is nil, then throw an error on failure.  Return t otherwise.

\(fn &optional NOERROR)" t nil)

;;;***

;;;### (autoloads (ede-speedbar-file-setup) "ede/speedbar" "speedbar.el"
;;;;;;  "6063471ec988b835f0fc32724c343abe")
;;; Generated autoloads from speedbar.el

(autoload 'ede-speedbar-file-setup "ede/speedbar" "\
Setup some keybindings in the Speedbar File display.

\(fn)" nil nil)

;;;***

;;;### (autoloads (ede-vc-project-directory ede-upload-html-documentation
;;;;;;  ede-upload-distribution ede-edit-web-page ede-web-browse-home)
;;;;;;  "ede/system" "system.el" "82788557cf1e7840a4308536fe1bbf44")
;;; Generated autoloads from system.el

(autoload 'ede-web-browse-home "ede/system" "\
Browse the home page of the current project.

\(fn)" t nil)

(autoload 'ede-edit-web-page "ede/system" "\
Edit the web site for this project.

\(fn)" t nil)

(autoload 'ede-upload-distribution "ede/system" "\
Upload the current distribution to the correct location.
Use /user@ftp.site.com: file names for FTP sites.
Download tramp, and use /r:machine: for names on remote sites w/out FTP access.

\(fn)" t nil)

(autoload 'ede-upload-html-documentation "ede/system" "\
Upload the current distributions documentation as HTML.
Use /user@ftp.site.com: file names for FTP sites.
Download tramp, and use /r:machine: for names on remote sites w/out FTP access.

\(fn)" t nil)

(autoload 'ede-vc-project-directory "ede/system" "\
Run `vc-dir' on the current project.

\(fn)" t nil)

;;;***

;;;### (autoloads (ede-update-version) "ede/util" "util.el" "0bff38f166b26cdd787a81c16d613e9a")
;;; Generated autoloads from util.el

(autoload 'ede-update-version "ede/util" "\
Update the current projects main version number.
Argument NEWVERSION is the version number to use in the current project.

\(fn NEWVERSION)" t nil)

;;;***

;;;### (autoloads nil nil ("auto.el" "autoconf-edit.el" "base.el"
;;;;;;  "dired.el" "makefile-edit.el" "pconf.el" "pmake.el" "proj-archive.el"
;;;;;;  "proj-aux.el" "proj-comp.el" "proj-elisp.el" "proj-info.el"
;;;;;;  "proj-misc.el" "proj-obj.el" "proj-prog.el" "proj-scheme.el"
;;;;;;  "proj-shared.el" "proj.el" "project-am.el" "shell.el" "source.el"
;;;;;;  "srecode.el") (20623 60567 882413))

;;;***

(provide 'loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; loaddefs.el ends here
