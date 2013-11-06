(in-package :cs325-user)

(defun make-change (x &optional (lst '(25 10 5 1)))
  (values-list (get-coins x lst)))

(defun get-coins (x &optional (lst '(25 10 5 1)))
  (multiple-value-bind (first second) (floor x (car lst))
                       (if (endp (cdr lst))
                           (list first)
                           (cons first (get-coins second (cdr lst))))))