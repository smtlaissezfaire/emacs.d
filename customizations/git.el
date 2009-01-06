
;; Set the blame format for git-blame-mode.  Use short commit hash
(setq git-blame-log-oneline-format "format:[%h, %cr] %cn: %s")

(defun git-describe-commit (hash)
  (with-temp-buffer
    (call-process "git" nil t nil
                  "log" "-1" (concat "--pretty=" git-blame-log-oneline-format)
                  hash)
    (buffer-substring (point-min) (1- (point-max)))))
