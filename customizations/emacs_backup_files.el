; backup settings
(setq
   ; dont' clobber symlinks
   backup-by-copying t      
   ; save the backups in ~/.saves
   backup-directory-alist '(("." . "~/.saves"))
   ; delete excess backups silently
   delete-old-versions t
   ; store an insane amount of backups, just in case
   kept-new-versions 5
   kept-old-versions 5
   ; stores numbers for each version
   version-control t)
