;; erc logging
(setq erc-log-insert-log-on-open t)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/Documents/erc_logs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps f)
(setq erc-save-buffer-on-part t)

; highlight keywords that match the following
(require 'erc-match)
(setq erc-keywords '("smt" "smtlaissezfaire" "Scott" "Taylor" "rspec"))

(require 'erc-join)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#ruby-lang" "#rspec" "#nyc.rb")))

(setq erc-user-full-name "Scott Taylor")
(setq erc-email-userid "scott@railsnewbie.com")
