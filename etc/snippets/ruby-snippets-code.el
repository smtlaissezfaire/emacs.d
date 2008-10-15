
(defun ruby-snippets-rfd ()
  (interactive)
  (insert "require File.dirname(__FILE__) + \"/\"")
  (backward-char))

(defalias 'rrfd 'ruby-snippets-rfd)

(defun ruby-snippets-debug ()
  (interactive)
  (insert "$debug = true; require 'rubygems'; require 'ruby-debug'; debugger"))

(defalias 'rdg 'ruby-snippets-debug)

(defun ruby-snippets-debug-if ()
  (interactive)
  (insert "debugger if $debug == true"))

(defalias 'rdgbc 'ruby-snippets-debug-if)

(defun ruby-snippets-set-debug-flag
  (interactive)
  (insert "$debug = true"))

(defalias 'rdebug 'ruby-snippets-set-debug-flag)