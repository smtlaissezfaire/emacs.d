(defun set-start-load-time ()
  (defvar *emacs-load-start* (current-time)))

(defun report-total-load-time ()
  (message "My .emacs loaded in %ds" 
           (destructuring-bind 
               (hi lo ms) 
               (current-time)
             (- (+ hi lo) 
                (+ (first *emacs-load-start*) 
                   (second *emacs-load-start*))))))


