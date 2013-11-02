(in-package :cs325-user)

(defun occurrences (x)
  (cond ((null x) nil)
        (t (do ((l x (cdr l))
                (lst '() (cond ((null (assoc (car l) lst)) (acons (car l) 1 lst))
                               (t (incf (cdr (assoc (car l) lst))) lst))))
               ((null l) (sort lst #'> :key #'cdr))))))