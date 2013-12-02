(in-package :cs325-user)

(defun intersperse (obj lst)
  (if (null lst) nil
      (do ((l (cdr lst) (cdr l))
           (x (car lst) (car l))
           (res nil (list* obj x res)))
          ((endp l) (reverse (cons x res))))))

(defun intersperse (obj lst)
  (cond ((null lst) nil) 
    ((null (cdr lst)) (list (car lst)))
    (t (list* (car lst) obj (intersperse obj (cdr lst))))))
