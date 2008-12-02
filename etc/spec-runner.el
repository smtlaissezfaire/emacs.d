
(defun run-specs ()
  (interactive)
  (shell-command (concat (concat (project-root) "script/spec") " "
                         "--drb" " "
                         buffer-file-name)))

