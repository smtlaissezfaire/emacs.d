;;;; Find in project, Interactive
;; Plan: 
;;
;; - Set project root
;; - Use an interactive fuzzy-match against a string
;; - Make it interactive, so that files can be cycled through
;;
;; Dependencies:
;;  iswitchb

(add-to-list 'load-path "~/.emacs.d/projects/find-in-project")
(load "rails-helpers")

(defun interactive-find-in-project nil
  "If we are in a rails project, use the interactive lookup - otherwise,
use the regular old find-file (doesn't do this, yet)"
  ; taken from iswitch-b documentation
  (defun interactive-find-in-project-prompt (prompt choices)
    "Use iswitch as a completing-read replacement to choose from
choices.  PROMPT is a string to prompt with.  CHOICES is a list of
strings to choose from."
    (let ((iswitchb-make-buflist-hook
           (lambda ()
             (setq iswitchb-temp-buflist choices))))
      (iswitchb-read-buffer prompt)))
  (interactive)
  (cond ((project-root)
         (lookup-and-switch-to
          (interactive-find-in-project-prompt "find-in-project: "
                                              (find-files (project-root)))))))
(defun lookup-and-switch-to (file)
  (find-file (concat (project-root) file)))

(defun find-files (project-root)
  "Find all the files in a project, and create a list of dotted pairs,
with the complete path name as the cdr, and the abbreviated path name as the car"
  (defun find-all-files (directory-root &optional shell-cmd)
    (unless shell-cmd
      (setf shell-cmd "find ."))
    (save-excursion
      (with-temp-buffer
        (cd directory-root)
        (split-string (shell-command-to-string shell-cmd)))))

  (find-all-files project-root (find-command)))

(defconst *default-find-command-for-root-dir*
  "find . | grep '.rb\\|.rhtml' | grep -v .svn | grep -v '\#' | grep -v '\~'")

(defun find-command nil
  "Find the command to find files.  Usually it's a 'find | grep'.
   Uses the text .emproj if it exists, otherwise uses the default rails find command"
  (setq emproj_file (concat (project-root) ".emproj"))
  (cond ((file-exists-p emproj_file)
         (read (read-file emproj_file)))
        ((generic-project-root-p)
         *default-find-command-for-root-dir*)))

;;;;;;;;;;;;;;;;;;
;;              ;;
;; Keymappings  ;;
;;              ;;
;;;;;;;;;;;;;;;;;;

(global-set-key "\C-xp" 'interactive-find-in-project)

   

