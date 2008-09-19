
(defun ruby-snippets-rfd ()
  (interactive)
  (insert "require File.dirname(__FILE__) + \"/\"")
  (backward-char))

(defun ruby-snippets-debug ()
  (interactive)
  (insert "$debug = true; require 'rubygems'; require 'ruby-debug'; debugger"))

(defun ruby-snippets-debug-if ()
  (interactive)
  (insert "debugger if $debug == true"))
