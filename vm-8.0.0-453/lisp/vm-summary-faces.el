;;; vm-summary-faces.el --- faces support for VM summary buffers
;; 
;; Copyright (C) 2001 Robert Fenk
;;
;; Author:      Robert Fenk
;; Status:      Tested with XEmacs 21.4.15 & VM 7.18
;; Keywords:    VM 
;; X-URL:       http://www.robf.de/Hacking/elisp
;; Version:     $Id$

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License along
;; with this program; if not, write to the Free Software Foundation, Inc.,
;; 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

;;; Commentary:
;;
;;  to use this add the following line to your ~/.vm file
;;
;;  (require 'vm-summary-faces)
;;  (vm-summary-faces-mode 1)
;;

(defgroup vm nil
  "VM"
  :group 'mail)

(defgroup vm-summary-faces nil
  "VM additional virtual folder selectors and functions."
  :group 'vm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-and-compile
  (require 'advice)
  (require 'cl)
  (require 'vm-summary)
  (require 'vm-virtual))

(eval-and-compile
  (if vm-xemacs-p (require 'overlay)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defface vm-summary-selected-face
  '((t (:bold on)))
  "The face used in VM Summary buffers for the selected message."
  :group 'vm-summary-faces)

(defface vm-summary-marked-face
  '((((type x)) (:foreground "red3")))
  "The face used in VM Summary buffers for marked messages."
  :group 'vm-summary-faces)

(defface vm-summary-deleted-face
  '((t (:foreground "grey50" :strikethru t)))
  "The face used in VM Summary buffers for deleted messages."
  :group 'vm-summary-faces)

(defface vm-summary-new-face
  '((t (:foreground "blue")))
  "The face used in VM Summary buffers for new messages."
  :group 'vm-summary-faces)

(defface vm-summary-unread-face
  '((t (:foreground "blue4")))
  "The face used in VM Summary buffers for unread messages."
  :group 'vm-summary-faces)

(defface vm-summary-filed-face
  '((t (:foreground "green4" :underline t)))
  "The face used in VM Summary buffers for filed messages."
  :group 'vm-summary-faces)

(defface vm-summary-written-face
  '((t (:foreground "green4" :underline t)))
  "The face used in VM Summary buffers for written messages."
  :group 'vm-summary-faces)

(defface vm-summary-replied-face
  '((t (:foreground "grey50")))
  "The face used in VM Summary buffers for replied messages."
  :group 'vm-summary-faces)

(defface vm-summary-forwarded-face
  '((t (:foreground "grey50")))
  "The face used in VM Summary buffers for forwarded messages."
  :group 'vm-summary-faces)

(defface vm-summary-edited-face 
  nil
  "The face used in VM Summary buffers for edited messages."
  :group 'vm-summary-faces)

(defface vm-summary-redistributed-face
  '((t (:foreground "grey50")))
  "The face used in VM Summary buffers for redistributed messages."
  :group 'vm-summary-faces)

(defface vm-summary-outgoing-face
  '((t (:foreground "grey50")))
  "The face used in VM Summary buffers for outgoing messages."
  :group 'vm-summary-faces)

(defface vm-summary-high-priority-face
  '((t (:foreground "red")))
  "The face used in VM Summary buffers for high-priority messages."
  :group 'vm-summary-faces)

(defface vm-summary-default-face
  nil
  "The default face used in VM Summary buffers."
  :group 'vm-summary-faces)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defcustom vm-summary-faces-alist
  '(
    ((or (header "Priority: urgent")
         (header "Importance: high")
         (header "X-Priority: 1")
         (label "!")
         (header "X-VM-postponed-data:"))
     vm-summary-high-priority-face)
    ((deleted)   vm-summary-deleted-face)
    ((new)       vm-summary-new-face)
    ((unread)    vm-summary-unread-face)
    ((filed)     vm-summary-filed-face)
    ((written)   vm-summary-written-face)
    ((replied)   vm-summary-replied-face)
    ((forwarded) vm-summary-forwarded-face)
    ((edited)    vm-summary-edited-face)
    ((redistributed) vm-summary-redistributed-face)
    ((marked)    vm-summary-marked-face)
    ((outgoing)  vm-summary-outgoing-face)
    ((any)       vm-summary-default-face))
  "Alist of virtual folder conditions and corresponding faces.
Order matters. The first matching one will be used as face."
  :type '(repeat (cons (sexp) (face)))
  :group 'vm-summary-faces)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-and-compile
  (if (fboundp 'mapcar-extents)
      (defun vm-summary-faces-list-extents () `(mapcar-extents 'identity))
    (defun vm-summary-faces-list-extents ()
      (let ((o (overlay-lists))) (nconc (car o) (cdr o))))))

;;;###autoload
(defun vm-summary-faces-hide (&optional face)
  "Toggle visibility of messages with FACE.
When called with a prefix arg prompt for the face."
  (interactive "P")
  (if (and (listp face) (numberp (car face)))
      (setq face (completing-read "Face name: "
                                  (mapcar (lambda (f)
                                            (list (format "%s" (caar f))))
                                          vm-summary-faces-alist)
                                  nil t "deleted")))
  (if (not face) (setq face "deleted"))
  (vm-summarize)
  (vm-select-folder-buffer)
  (set-buffer vm-summary-buffer)
  (let ((visibility 'check)
        (extents (vm-summary-faces-list-extents))
        (face (intern (concat "vm-summary-" face "-face")))
        x)
    (while extents
      (setq x (car extents)) 
      (when (equal face (vm-extent-property x 'face))
        (if (eq visibility 'check)
            (setq visibility (not (vm-extent-property x 'invisible))))
        (vm-set-extent-property x 'invisible visibility)
        (setq extents (car extents))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar vm-summary-faces-su-start-of nil)
(defvar vm-summary-faces-su-end-of nil)
(defvar vm-summary-faces-message nil)

;;;###autoload
(defun vm-summary-faces-add (&optional start end)
  "Add faces to a summary entry according to `vm-summary-faces-alist'."
  (interactive "P")
  
  (if (and (memq major-mode '(vm-mode vm-virtual-mode vm-summary-mode
                                      vm-presentation-mode))
           t) ;vm-summary-buffer)
      (save-excursion
        (vm-select-folder-buffer)
        (let ((faces vm-summary-faces-alist)
              (msg (or vm-summary-faces-message
                       (if vm-message-pointer (car vm-message-pointer))))
              vm-summary-face)
          (setq vm-summary-face vm-summary-face)
          (setq start (or start
                          vm-summary-faces-su-start-of
                          (vm-su-start-of msg))
                end   (or end
                          vm-summary-faces-su-end-of
                          (vm-su-end-of msg)))
          (while faces
            (when (apply 'vm-vs-or msg (list (caar faces)))
              (save-excursion 
                (set-buffer vm-summary-buffer)
                (vm-summary-xxxx-highlight-region start end
                                                  (cadar faces)
                                                  'vm-summary-face)
                (setq faces nil)))
            (setq faces (cdr faces)))))))

(defvar vm-summary-faces-fix-pointer t)
(make-variable-buffer-local 'vm-summary-faces-fix-pointer)

(defun vm-summary-faces-fix-pointer ()
  (save-excursion
    (vm-select-folder-buffer)
    ;; remove the selected (highlight) face
    (if vm-summary-buffer
        (save-excursion
          (set-buffer vm-summary-buffer)
          (if (and vm-summary-faces-fix-pointer
                   (symbol-value 'vm-summary-overlay))
            (let ((ooo (symbol-value 'vm-summary-overlay))
                  (face vm-summary-highlight-face))
              (vm-set-extent-property ooo 'face face)
              (vm-set-extent-property ooo 'priority 10)
              (if vm-xemacs-p (set-extent-priority ooo 10))
              ;; we get called as long as we were not able to fix the
              ;; overlay/extent, but now we are done ...
              (setq vm-summary-faces-fix-pointer nil)))))))
  
(defvar vm-summary-faces-mode nil)

;;;###autoload
(defun vm-summary-faces-mode (&optional arg)
  "Toggle `vm-summary-faces-mode'.
Remove/add the `vm-summary-fontify-buffer' hook from the hook variable
`vm-summary-mode-hook' and when in a summary buffer, then toggle the
`font-lock-mode'."
  (interactive "P")
  (if (null arg)
      (setq vm-summary-faces-mode (not vm-summary-faces-mode))
    (if (> (prefix-numeric-value arg) 0)
        (setq vm-summary-faces-mode t)
      (setq vm-summary-faces-mode nil)))

  
  (setq vm-summary-highlight-face
        (if vm-summary-faces-mode
            'vm-summary-selected-face
          'bold))

  (if (memq major-mode '(vm-mode vm-virtual-mode vm-summary-mode
                                 vm-presentation-mode))
      (save-excursion
        (vm-select-folder-buffer)
        (vm-summarize)
        (if vm-summary-buffer
            (save-excursion
              (set-buffer vm-summary-buffer)
              (setq vm-summary-faces-fix-pointer t)
              (vm-summary-faces-fix-pointer)))
        (if vm-summary-faces-mode
            (let ((mp vm-message-list))
              (while mp
                (setq vm-summary-faces-message (car mp))
                (vm-summary-faces-add)
                (setq mp (cdr mp))))
          
          (vm-set-summary-redo-start-point t)
          (vm-update-summary-and-mode-line))))
  (setq vm-summary-faces-message nil))

(defadvice vm-tokenized-summary-insert
  (around vm-summary-faces activate)
  (setq vm-summary-faces-su-start-of (point)
        vm-summary-faces-su-end-of   nil
        vm-summary-faces-message (ad-get-arg 0))
  ad-do-it
  (when vm-summary-faces-mode
    (setq vm-summary-faces-su-end-of (point))
    (vm-summary-faces-add))

  (setq vm-summary-faces-su-start-of nil
        vm-summary-faces-su-end-of   nil
        vm-summary-faces-message  nil))

(add-hook 'vm-summary-pointer-update-hook 'vm-summary-faces-fix-pointer)

(provide 'vm-summary-faces)
