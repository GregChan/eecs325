(defun show-dots (lst)
  (format t "~A" (generate-dotted-string lst)))

(defun show-lists (lst)
  (cond ((null lst)) ))

(defun generate-dotted-string (lst)
  (cond ((null lst) nil)
        ((atom lst) lst)
        (t (format nil "(~A . ~A)" 
                   (generate-dotted-string (car lst))
                   (generate-dotted-string (cdr lst))))))