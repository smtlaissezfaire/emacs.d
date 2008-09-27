(setq inferior-lisp-program "/opt/local/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/vendor/slime")
(require 'slime)
(slime-setup)
