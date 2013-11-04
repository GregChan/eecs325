(in-package :cs325-user)

(defun occurrences (x)
  (when (null x) nil)
  (do ((l x (cdr l))
       (lst '() (let ((y (assoc (car l) lst)))
                  (cond ((null y) (acons (car l) 1 lst))
                        (t (incf (cdr y)) lst)))))
      ((null l) (sort lst #'> :key #'cdr))))