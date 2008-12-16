(defconst *gemdir* "/usr/lib/ruby/user-gems/1.8/gems")
(defun go-to-gemdir nil
  (interactive)
  (find-file *gemdir*))
(defalias 'gemdir 'go-to-gemdir)


(defconst *flavorpill* "~/src/git/flavorpill_com")
(defun go-to-flavorpill-directory nil 
  (interactive)
  (find-file *flavorpill*))
(defalias 'fp 'go-to-flavorpill-directory)

(defconst *guillotine* "~/src/git/guillotine")
(defun go-to-guillotine-directory nil
  (interactive)
  (find-file *guillotine*))
(defalias 'guillotine 'go-to-guillotine-directory)

(defconst *spotio* "~/src/git/spot.io")
(defun go-to-spotio-directory nil
  (interactive)
  (find-file *spotio*))
(defalias 'spotio 'go-to-spotio-directory)

