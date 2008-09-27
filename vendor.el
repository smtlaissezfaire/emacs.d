
(add-to-list 'load-path
             (progn (cd "~/.emacs.d/vendor")
                    (normal-top-level-add-subdirs-to-load-path)))

(require 'cl)
; not sure why, but here we need to specify the file
; path explicitly
(require 'find-recursive "~/.emacs.d/vendor/find-recursive.el")

; ruby syntax highlighting, ruby-electric:
(require 'inf-ruby)
(require 'ruby-electric)

; rcodetools - use with M-x xmp to capture STDOUT
(require 'rcodetools "~/.emacs.d/vendor/rcodetools.el")

; a rails package - lots of useful stuff
(require 'rails "~/.emacs.d/vendor/emacs-rails/rails.el")
(require 'rinari)

; flymake, for ruby
(require 'flymake)

; for chatting on irc
(require 'erc)

; javascript mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq auto-mode-alist (append '(("\\.js$" . c-mode)) auto-mode-alist))

; for version control
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)
(require 'git)
(require 'gitsum)

; treetop ruby editing mode:
(load "~/.emacs.d/vendor/treetop")

; slime
(load "~/.emacs.d/vendor/slime")