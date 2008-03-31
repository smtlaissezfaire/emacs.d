;;; vm-message-history.el --- Move backward & forward through selected messages
;; -*-unibyte: t; coding: iso-8859-1;-*-

;; Copyright © 2003 Kevin Rodgers

;; Author: Kevin Rodgers <ihs_4664@yahoo.com>
;; Created: 6 Oct 2003
;; Version: $Revision: 1.2 $
;; Keywords: mail, history
;; RCS: $Id: vm-message-history.el,v 1.2 2003/10/08 14:18:42 kevinr Exp $

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

;;; Commentary:

;; VM defines the `vm-goto-message-last-seen' command (bound to TAB) to
;; toggle between 2 messages, but doesn't provide a general history
;; mechanism.  This library allows the user to move backward and forward
;; through the messages that have already been selected in each folder.
;; It mimics a web browser in that selecting a message causes more
;; recently selected messages in the history list to be forgotten
;; (except when using `vm-goto-message-last-seen' or one of the
;; vm-message-history.el commands).

;; Usage:
;; (require 'vm-message-history)
;; M-x vm-visit-folder
;; M-x vm-message-history-backward	; C-c b, Motion -> Backward in History
;; M-x vm-message-history-forward	; C-c f, Motion -> Forward in History
;; M-x vm-message-history-browse	;        Motion -> Browse History

;; To do:
;; 1. Expunged messages in the history list?

;;; Code:

(require 'vm)				; vm-message-pointer, vm-message-list,
					; vm-select-folder-buffer,
					; vm-preview-current-message,
					; vm-record-and-change-message-pointer,
					; vm-summary-sprintf

;; (or (fboundp 'define-key-after)
;;     (require 'fsf-compat))		; XEmacs

(defgroup vm-message-history nil
  "Message history for VM folders."
  :group 'vm)

(defcustom vm-message-history-max 32
  "The number of read or previewed messages in each folder's history."
  :type 'integer
  :group 'vm-message-history)

(defvar vm-message-history nil
  "A list of messages in the current folder.")

(defvar vm-message-history-pointer nil
  "The cons in `vm-message-history' whose car is the current message.")

(defun vm-message-history-init ()
  "Initialize `vm-message-history'.
Also bind keys in `vm-mode-map' to `vm-message-history-backward' and
`vm-message-history-forward'."
  (set (make-local-variable 'vm-message-history-pointer)
       (set (make-local-variable 'vm-message-history) '()))
  ;; Bind keys and add menu items in vm-mode-map and vm-summary-mode-map:
  (local-set-key "\C-cb" 'vm-message-history-backward)
  (local-set-key "\C-cf" 'vm-message-history-forward)
  (define-key-after (local-key-binding [menu-bar vm-menubar-motion]) [backward]
    '("Backward in History" . vm-message-history-backward)
    (car (where-is-internal 'vm-goto-message-last-seen
			    (local-key-binding
			     [menu-bar vm-menubar-motion]))))
  (define-key-after (local-key-binding [menu-bar vm-menubar-motion]) [forward]
    '("Forward in History" . vm-message-history-forward)
    [backward])
  (define-key-after (local-key-binding [menu-bar vm-menubar-motion]) [history]
    '("Browse History" . vm-message-history-browse)
    [forward]))

(defun vm-message-history-add ()
  "Add the selected message to `vm-message-history'.
\(Unless the message was selected via \\[vm-message-history-backward] or
\\[vm-message-history-forward].)"
  (or (memq this-command '(vm-goto-message-last-seen
			   vm-message-history-backward
			   vm-message-history-forward
			   vm-message-history-browse))
      (progn
	(setq vm-message-history-pointer
	      ;; Discard messages selected after the current message:
	      (setq vm-message-history
		    (cons (car vm-message-pointer) vm-message-history-pointer)))
	;; Discard oldest messages:
	(setcdr (or (nthcdr (1- vm-message-history-max) vm-message-history)
		    '(t))		; hack!
		nil))))

;;;###autoload
(defun vm-message-history-backward (&optional arg)
  "Select the previous message in the current folder's history.
With prefix ARG, select the ARG'th previous message."
  (interactive "p")
  (or arg (setq arg 1))
  (vm-select-folder-buffer)
  (or vm-message-history
      (error "No message history"))
  (cond ((> arg 0)
	 (setq vm-message-history-pointer
	       (or (nthcdr arg vm-message-history-pointer)
		   ;; wrap around to newest message:
		   vm-message-history)))
	((< arg 0)
	 (let ((pointer vm-message-history))
	   (while (and pointer
		       (not (eq (nthcdr (- arg) pointer)
				vm-message-history-pointer)))
	     (setq pointer (cdr pointer)))
	   (setq vm-message-history-pointer
		 (or pointer
		     ;; wrap around to oldest message:
		     (if (fboundp 'last)
			 (last vm-message-history) ; Emacs 21, or cl.el
		       (progn
			 (setq pointer vm-message-history)
			 (while (consp (cdr pointer))
			   (setq pointer (cdr pointer)))
			 pointer)))))))
  (if (eq (car vm-message-pointer) (car vm-message-history-pointer))
      (vm-preview-current-message)
    (vm-record-and-change-message-pointer vm-message-pointer
					  (memq (car vm-message-history-pointer)
						vm-message-list))
    (vm-preview-current-message)))

;;;###autoload
(defun vm-message-history-forward (&optional arg)
  "Select the next message in the current folder's history.
With prefix ARG, select the ARG'th next message."
  (interactive "p")
  (vm-message-history-backward (- arg)))

(defvar vm-message-history-menu nil
  "A popup menu of messages, generated from `vm-message-history'.")

;;;###autoload
(defun vm-message-history-browse ()
  "Select a message from a popup menu of the current folder's history."
  (interactive)
  (vm-select-folder-buffer)
  (funcall (or (lookup-key vm-message-history-menu
			   (vector (x-popup-menu t vm-message-history-menu)))
	       'ignore)))

(put 'vm-message-history-browse 'menu-enable '(vm-message-history-menu-enable))

(defun vm-message-history-menu-enable ()
  "Generate `vm-message-history-menu' from `vm-message-history'."
  (vm-select-folder-buffer)
  ;; Discard previous menu:
  (setq vm-message-history-menu
	(make-sparse-keymap "History"))
  (let ((history vm-message-history)
	symbol)
    (while history
      (setq symbol
	    (intern (format "vm-message-history-%d" (length history))))
      (set symbol			; pointer into vm-message-list
	   history)			; (memq (car history) vm-message-list))
      (fset symbol			; function to select message
	    `(lambda ()
	       (vm-record-and-change-message-pointer vm-message-pointer
						     ,symbol)
	       (vm-preview-current-message)))
      (define-key vm-message-history-menu (vector symbol)
	(cons (vm-summary-sprintf vm-summary-format (car history))
	      (if (eq (car history) (car vm-message-pointer)) ; selected
		  nil			; disabled
		symbol)))		; function
      (setq history (cdr history))))
  vm-message-history)

;; (add-hook 'vm-visit-folder-hook 'vm-message-history-init)
(add-hook 'vm-mode-hook 'vm-message-history-init)
(add-hook 'vm-select-message-hook 'vm-message-history-add)

(provide 'vm-message-history)

;;; vm-message-history.el ends here