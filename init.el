
(load "~/.emacs.d/etc/load_times")
(set-start-load-time)

(load "~/.emacs.d/etc/utils.el")

(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

(load "~/.emacs.d/vendor.el")
(load "~/.emacs.d/etc/colors.el")
(load "~/.emacs.d/customizations/tabs.el")
(load "~/.emacs.d/customizations/full_screen.el")
(load "tramp_customization")
(load "ruby-snippets-code")
(load "flymake-ruby")
(load "spec-runner")
(load "ido-find-in-project")
(load "erlang_emacs")
(load "~/.emacs.d/etc/common_directories")

;;;;;;;;;;;;;;;;;;;;
;  themes
;
;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/themes/vibrant-ink")
(load "~/.emacs.d/etc/start_up.el")

(report-total-load-time)


