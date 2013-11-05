(in-package :cs325-user)

(defun has-number-p (lst)
  (cond ((null lst) nil)
        ((and (listp lst) (some #'numberp lst)) t)
        ((atom lst) (numberp lst))
        (t (or (has-number-p (car lst)) 
               (has-number-p (cdr lst))))))