(defvar *rails-environment-file* "config/environment.rb")
(defvar *git-project-root-file* ".git")
(defvar *project-file* ".emproj")

;; Taken from rinari, with a slight modification
(defun find-in-project-rails-root nil
  (project-file-root *rails-environment-file*))

(defun git-project-root nil
  (project-file-root *git-project-root-file*))

(defun project-root nil
  (or 
   (project-file-root *project-file*)
   (generic-project-root-p)))

(defun generic-project-root-p nil
  (or (find-in-project-rails-root)
      (git-project-root)))

(defun project-file-root (file &optional dir)
  (or dir (setq dir default-directory))
  (cond ((file-exists-p (concat dir file))
         dir)
        ((equal dir  "/")
         nil)
        ((project-file-root file (expand-file-name (concat dir "../"))))))



