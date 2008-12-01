(defvar *rails-environment-file* "config/environment.rb")
(defvar *git-project-root-file* ".git")
(defvar *project-file* ".emproj")

;; Define rails-root if it's not around
(unless (functionp 'rails-root)
  ;; Taken from rinari, with a slight modification
  (defun rails-root
    (project-file-root *rails-environment-file*)))

(defun git-project-root nil
  (project-file-root *git-project-root-file*))

(defun project-root nil
  (or 
   (project-file-root *project-file*)
   (generic-project-root-p)))

(defun generic-project-root-p nil
  (or (rails-root)
      (git-project-root)))

(defun project-file-root (file &optional dir)
  (or dir (setq dir default-directory))
  (cond ((file-exists-p (concat dir file))
         dir)
        ((equal dir  "/")
         nil)
        ((project-file-root file (expand-file-name (concat dir "../"))))))



