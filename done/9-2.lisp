(in-package :cs325-user)

(defun get-coins (x &optional (lst '(25 10 5 1)))
  (if (endp lst) 
      nil
      (multiple-value-bind (quotient remainder) (floor x (car lst))
        (cons quotient (get-coins remainder (cdr lst))))))

(defun make-change (x &optional (lst '(25 10 5 1)))
  (values-list (get-coins x lst)))