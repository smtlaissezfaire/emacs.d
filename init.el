
; load time for emacs (also, see bottom of the file)
(require 'cl)
(defvar *emacs-load-start* (current-time))

(load "~/.emacs.d/etc/utils.el")

; use iswitchb
(iswitchb-mode)
(iswitchb-default-keybindings)

(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

(load "~/.emacs.d/vendor.el")
(load "~/.emacs.d/etc/colors.el")
(load "~/.emacs.d/customizations/tabs.el")
(load "~/.emacs.d/customizations/full_screen.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; random customization ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

; don't insert mule encoding utf-8 string at the top of a file
(defun ruby-mode-set-encoding())

; use option for the metakey for emacs (aquaemacs / x11)
(setq mac-option-modifier 'meta)


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

