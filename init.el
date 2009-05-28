
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
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("~/src/git/flavorpill_com" "/")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
