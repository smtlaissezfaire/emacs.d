(defun save-macro (name)                  
  "save a macro. Take a name as argument
     and save the last defined macro under 
     this name at the end of your .emacs"
  (interactive "SName of the macro :") ; ask for the name of the macro    
  (kmacro-name-last-macro name)      ; use this name for the macro    
  (find-file "~/.emacs.d/macros.el") ; open the .emacs.d macro file file 
  (goto-char (point-max))            ; go to the end of the macro file
  (newline)                          ; insert a newline
  (insert-kbd-macro name)            ; copy the macro 
  (newline)                          ; insert a newline
  (switch-to-buffer nil))            ; return to the initial buffer