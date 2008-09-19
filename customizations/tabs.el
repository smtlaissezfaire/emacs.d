;; *DONT* use tabs
(setq-default indent-tabs-mode nil)

;; set tab with to 2 chars (instead of 4 or 8)
(defun set-tab-stop-width (count)
  (require 'cl)
  (setq tab-stop-list (loop for i from count to 120 by count collect i)))

;; To cause the TAB file-character to be interpreted as 2 space indentation
(setq-default tab-width 2)

;; Use 2 spaces for a "soft tab"
(setq-default c-basic-offset 2)
(set-tab-stop-width 2)