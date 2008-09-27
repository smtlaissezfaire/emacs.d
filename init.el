
(load "~/.emacs.d/etc/load_times")
(set-start-load-time)

; the load order of the following *is* important
(load "~/.emacs.d/etc/colors/rinari.el")
(load "~/.emacs.d/etc/utils.el")
(load "~/.emacs.d/vendor.el")
(load "~/.emacs.d/customizations/flymake-ruby")
(load "~/.emacs.d/etc/colors/flymake.el")
(load "~/.emacs.d/themes/vibrant-ink")

; the order of the following files is unimportant
(load "~/.emacs.d/projects/find-in-project/ido-find-in-project")
(load "~/.emacs.d/customizations/erlang_emacs")
(load "~/.emacs.d/customizations/emacs_backup_files")
(load "~/.emacs.d/customizations/tabs.el")
(load "~/.emacs.d/customizations/full_screen.el")
(load "~/.emacs.d/customizations/tramp_customization")
(load "~/.emacs.d/customizations/keybindings")
(load "~/.emacs.d/etc/snippets/ruby-snippets-code")
(load "~/.emacs.d/etc/common_directories")
(load "~/.emacs.d/etc/spec-runner")

; this should always be loaded last:
(load "~/.emacs.d/etc/start_up.el")
(report-total-load-time)
