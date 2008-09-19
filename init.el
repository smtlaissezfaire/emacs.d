
(load "~/.emacs.d/etc/load_times")
(set-start-load-time)

; load time for emacs (also, see bottom of the file)
(require 'cl)

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


; my own custom extensions: 
(load "tramp_customization")
(load "ruby-snippets-code")
(load "flymake-ruby")
(load "spec-runner")
(load "ido-find-in-project")
(load "erlang_emacs")


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

(load "~/.emacs.d/themes/vibrant-ink")
(load "~/.emacs.d/etc/start_up.el")

(report-total-load-time)


