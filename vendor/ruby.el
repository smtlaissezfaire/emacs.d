(add-to-list 'load-path "~/.emacs.d/vendor/ruby/")

(require 'ruby-mode)
(require 'inf-ruby)

;; we need flymake later on in the process for font-faces.
;; *DONT* put it in ruby-mode-hook
(require 'flymake)

; rcodetools - use with M-x xmp to capture STDOUT
;; (require 'rcodetools)

; a rails package - lots of useful stuff
(add-to-list 'load-path "~/.emacs.d/vendor/rinari/")
(require 'rinari)

(add-hook 'ruby-mode-hook
          (lambda nil
            (require 'ruby-electric)
            (ruby-electric-mode)
            (flymake-mode-on)))
