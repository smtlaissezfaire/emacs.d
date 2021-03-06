; backup settings
(setq
   ; dont' clobber symlinks
   backup-by-copying t
   ; save the backups
   backup-directory-alist '(("." . "~/.emacs.d/auto-save-list"))
   ; delete excess backups silently
   delete-old-versions t
   ; store an insane amount of backups, just in case
   kept-new-versions 5
   kept-old-versions 5
   ; stores numbers for each version
   version-control t)

; autosave files: .# and #..# files
(setq auto-save-list-file-prefix "~/.emacs.d/auto-save-list")
