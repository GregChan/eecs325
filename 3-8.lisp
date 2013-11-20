(in-package :cs325-user)

(defun show-list (lst)
  (cond ((atom lst) (format t "~A" lst))
        (t (format t "[")
           (do ((l lst (cdr l)))
               ((atom l)
                (unless (null l)
                  (format t ". ~A" l)))
               (show-list (car l))
               (when (cdr l)
                 (format t " ")))
           (format t "]"))))

(defun show-dots (lst &optional (can-print t))
  (cond ((atom lst) (format can-print "~A" lst))
        (t (format can-print "(~A . ~A)" 
                   (show-dots (car lst) nil) 
                   (show-dots (cdr lst) nil)))))