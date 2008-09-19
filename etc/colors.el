; Rinari - rails support, with different erb colors
(defface erb-face
  `((t (:background "grey18")))
  "Default inherited face for ERB tag body"
  :group 'rhtml-faces)
(defface erb-delim-face
  `((t (:background "grey15")))
  "Default inherited face for ERB tag delimeters"
  :group 'rhtml-faces)

; flymake colors
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")
