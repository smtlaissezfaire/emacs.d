
(fset 'int_main
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([35 105 110 99 108 117 100 101 32 60 115 116 100 105 46 backspace 111 46 104 62 return return 105 110 116 32 109 97 105 110 40 41 5 32 123 return tab return 125 16] 0 "%d")) arg)))

