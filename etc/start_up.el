; remove the toolbar, menubar, scrollbar
(cond ((fboundp 'tool-bar-mode)
       (tool-bar-mode -1)
       (menu-bar-mode -1)
       (scroll-bar-mode -1)))

; set the option key to be the meta key
(setq mac-option-modifier 'meta)
; start full screen
(toggle-fullscreen)

; use iswitchb
(iswitchb-mode)
(iswitchb-default-keybindings)

; set highlighting with mark:
(transient-mark-mode t)

; always end a file with a newline:
(setq inhibit-default-init t)

; Start up emacs-client.  This allows us to open files from the command line
(server-start)

; don't insert mule encoding utf-8 string at the top of a file
(defun ruby-mode-set-encoding())

; use option for the metakey for emacs (aquaemacs / x11)
(setq mac-option-modifier 'meta)

(set-theme-to-vibrant-ink)
