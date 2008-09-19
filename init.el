
(load "~/.emacs.d/etc/load_times")
(set-start-load-time)

(load "~/.emacs.d/etc/utils.el")

(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

(load "~/.emacs.d/vendor.el")
(load "~/.emacs.d/etc/colors.el")
(load "~/.emacs.d/customizations/tabs.el")
(load "~/.emacs.d/customizations/full_screen.el")
(load "~/.emacs.d/customizations/tramp_customization")
(load "~/.emacs.d/etc/snippets/ruby-snippets-code")
(load "~/.emacs.d/customizations/flymake-ruby")
(load "~/.emacs.d/etc/spec-runner")
(load "~/.emacs.d/projects/find-in-project/ido-find-in-project")
(load "~/.emacs.d/customizations/erlang_emacs")
(load "~/.emacs.d/etc/common_directories")
(load "~/.emacs.d/themes/vibrant-ink")
(load "~/.emacs.d/etc/start_up.el")

(report-total-load-time)


