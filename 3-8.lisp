(in-package :cs325-user)

(defun show-dots (lst)
  (format t "~A" (generate-dotted-string lst)))

(defun show-list (lst)
  (cond ((null lst) (print lst))
        ((atom lst) (print lst))
        (t (princ "[")
           (do ((l lst (cdr l)))
               ((null l) (princ "]"))
               (princ (null (cadr l)))
               (cond ((atom (car l))
                      (cond ((null (cadr l)) (princ (format nil "~A" (car l))))
                            (t (princ (format nil "~A " (car l))))))
                     (t
                       (cond ((null (cadr l)) (show-list (car l))) 
                             (t (show-list (car l)) (princ " "))))))))
  nil)

(defun generate-dotted-string (lst)
  (cond ((null lst) nil)
        ((atom lst) lst)
        (t (format nil "(~A . ~A)" 
                   (generate-dotted-string (car lst))
                   (generate-dotted-string (cdr lst))))))