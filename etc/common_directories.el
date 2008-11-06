(defun go-to-dir (dir)
  (interactive)
  (find-file dir))
  

(defconst *gemdir* "/usr/lib/ruby/user-gems/1.8/gems")
(defun go-to-gemdir nil
  (go-to-gemdir *gemdir*))
(defalias 'gemdir 'go-to-gemdir)

(defconst *flavorpill* "~/src/git/flavorpill_com")
(defun go-to-flavorpill-directory nil 
  (go-to-gemdir *flavorpill*))
(defalias 'fp 'go-to-flavorpill-directory)
