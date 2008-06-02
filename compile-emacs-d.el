
;; byte compile all files in this directory

(defvar *my-special-compile-directories* '("~/.emacs.d/" "/Applications/Emacs.app" "~/src/git/emacs-extensions/"))

(defun byte-compile-selected-directories (dir_list)
  (cond 
   ((not (null dir_list))
    (byte-recompile-directory (car dir_list) 0)
    (byte-compile-selected-directories (cdr dir_list)))))
                              
(byte-compile-selected-directories *my-special-compile-directories*)