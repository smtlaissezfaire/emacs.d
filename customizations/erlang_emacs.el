(add-to-list 'load-path "/opt/local/lib/erlang/lib/tools-2.6.1/emacs")
(add-to-list 'load-path "/opt/local/lib/erlang/lib/tools-2.6.2/emacs")

(setq erlang-root-dir "/opt/local/lib/erlang")
(setq exec-path (cons "/opt/local/lib/erlang/bin" exec-path))
(require 'erlang-start)
(defvar inferior-erlang-prompt-timeout t)
