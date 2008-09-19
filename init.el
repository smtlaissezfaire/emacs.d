
; load time for emacs (also, see bottom of the file)
(require 'cl)
(defvar *emacs-load-start* (current-time))

(load "~/.emacs.d/etc/utils.el")

; use iswitchb
(iswitchb-mode)
(iswitchb-default-keybindings)

(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; vendor loading ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ruby syntax highlighting, ruby-electric:
(require 'inf-ruby)
(require 'ruby-electric)
; rcodetools - use with M-x xmp to capture STDOUT
(require 'rcodetools)
; a rails package - lots of useful stuff
(require 'rails)
(require 'rinari)
; flymake, for ruby
(require 'flymake)
(require 'erc)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq auto-mode-alist (append '(("\\.js$" . c-mode)) auto-mode-alist))
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)
(require 'git)
(require 'gitsum)
; treetop:
(load "treetop")



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; colors         ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Rinari - rails support, with different erb colors
(defface erb-face
  `((t (:background "grey18")))
  "Default inherited face for ERB tag body"
  :group 'rhtml-faces)
(defface erb-delim-face
  `((t (:background "grey15")))
  "Default inherited face for ERB tag delimeters"
  :group 'rhtml-faces)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; random customization ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

; don't insert mule encoding utf-8 string at the top of a file
(defun ruby-mode-set-encoding())

; use option for the metakey for emacs (aquaemacs / x11)
(setq mac-option-modifier 'meta)


;;; tabs;;;;;;;;;;;;;;;;;;;;

;; *DONT* use tabs
(setq-default indent-tabs-mode nil)
;; set tab with to 2 chars (instead of 4 or 8)
(defun set-tab-stop-width (count)
  (require 'cl)
  (setq tab-stop-list (loop for i from count to 120 by count collect i)))
;; To cause the TAB file-character to be interpreted as 2 space indentation
(setq-default tab-width 2)
;; Use 2 spaces for a "soft tab"
(setq-default c-basic-offset 2)
(set-tab-stop-width 2)


; my own custom extensions: 
(load "tramp_customization")
(load "ruby-snippets-code")
(load "flymake-ruby")
(load "spec-runner")
(load "ido-find-in-project")
(load "erlang_emacs")

; remove the toolbar, menubar, scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

; set the option key to be the meta key
(setq mac-option-modifier 'meta)

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(toggle-fullscreen)

; set highlighting with mark:
(transient-mark-mode t)

; always end a file with a newline:
(setq inhibit-default-init t)

; Start up emacs-client.  This allows us to open files from the command line
(server-start)


(defconst *gemdir* "/usr/lib/ruby/user-gems/1.8/gems")
(defun go-to-gemdir nil
  (interactive)
  (find-file *gemdir*))

(defconst *flavorpill* "~/src/git/flavorpill_com")
(defun go-to-flavorpill-directory nil 
  (interactive)
  (find-file *flavorpill*))
(defalias
  'fp
  (symbol-function 'go-to-flavorpill-directory))

;;;;;;;;;;;;;;;;;;;;
;  themes
;
;;;;;;;;;;;;;;;;;;;

(load "vibrant-ink")
(set-theme-to-vibrant-ink)




; load time for emacs.  (also see top of the file)
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                           (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))

