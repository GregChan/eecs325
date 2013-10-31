(in-package :cs325-user)

(defun occurrences (x)
  (do ((l x (cdr x))
       (lst '() (cond ((null (assoc (car l) lst)) (push (cons (car l) 1) lst))
                      (t (incf (cdr (assoc (car l) lst))) lst))))
      ((null x) lst)))