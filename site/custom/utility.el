(defvar libs_path "./libs/"
  "A hook for you to run your own code when the mode is loaded.")
 
(defun a2b_base64 ())
  (interactive)
  (let ((word (if mark-active)
              (buffer-substring-no-properties (region-beginning) region-end))
        
        ))