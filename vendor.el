
(add-to-list 'load-path "~/.emacs.d/vendor/")

(require 'cl)
(add-to-list 'load-path "~/.emacs.d/vendor/ruby")

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




; for chatting on irc
(require 'erc)

; javascript mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq auto-mode-alist (append '(("\\.js$" . c-mode)) auto-mode-alist))

; for version control
(add-to-list 'load-path "~/.emacs.d/vendor/git/")
(add-to-list 'load-path "~/.emacs.d/vendor/gitsum/")
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)
(require 'git)
(require 'gitsum)

; treetop ruby editing mode:
(load "~/.emacs.d/vendor/treetop")
