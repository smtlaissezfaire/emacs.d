(setq load-path 
      (cons  "/opt/local/lib/erlang/lib/tools-2.6.1/emacs"
             load-path))
(setq erlang-root-dir "/opt/local/lib/erlang")
(setq exec-path (cons "/opt/local/lib/erlang/bin" exec-path))
(require 'erlang-start)
(defvar inferior-erlang-prompt-timeout t)
