
(add-to-list 'load-path "~/.emacs.d/vendor/")

(require 'cl)

(load "~/.emacs.d/vendor/ruby")

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
