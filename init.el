
(load "~/.emacs.d/etc/load_times")
(set-start-load-time)

; the load order of the following *is* important
(load "~/.emacs.d/etc/colors/rinari")
(load "~/.emacs.d/etc/utils")
(load "~/.emacs.d/vendor")
(load "~/.emacs.d/etc/colors/flymake")
(load "~/.emacs.d/themes/vibrant-ink")

(load "~/.emacs.d/customizations")

; this should always be loaded last:
(load "~/.emacs.d/etc/start_up")
(report-total-load-time)
