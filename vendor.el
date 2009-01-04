
(add-to-list 'load-path "~/.emacs.d/vendor/")

(require 'cl)

(load "~/.emacs.d/vendor/ruby")

(require 'erc)

; javascript mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq auto-mode-alist (append '(("\\.js$" . c-mode)) auto-mode-alist))


;; cheat, for defunkt's cheat sheets:
(add-to-list 'load-path "~/.emacs.d/vendor/cheat")
(require 'cheat)

; for version control
(add-to-list 'load-path "~/.emacs.d/vendor/magit")
(require 'magit)

(add-to-list 'load-path "~/.emacs.d/vendor/gitsum")
(require 'gitsum)

(add-to-list 'load-path "~/.emacs.d/vendor/git-emacs")
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)

(add-to-list 'load-path "~/.emacs.d/vendor/treetop-mode")
(require 'treetop-mode)
(load "~/.emacs.d/vendor/yasnippet")
