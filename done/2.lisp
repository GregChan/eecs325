(in-package :cs325-user)

(defun greater (x y) 
  (cond ((> x y) x)
        (t y)))

(defun has-list-p (lst)
  (cond ((eq (length lst) 0) nil)
        ((listp (car lst)) t)
        (t (has-list-p (cdr lst)))))

(defun print-dots (x)
  (dotimes (i x)
    (princ ".")))

(defun print-dots (x)
  (cond ((> x 0) (princ ".") (print-dots (- x 1)))))

; (defun get-a-count (lst &optional (count 0))
;   (cond ((endp lst) count)
;         ((eq 'a (car lst))
;          (get-a-count (cdr lst) (+ count 1)))
;         (t (get-a-count (cdr lst) count))))

(defun get-a-count (lst)
  (do ((l lst (cdr l)) 
       (y 0 (if (eql (car l) 'a) (1+ y) y))) 
       ((null l) y)))


;For a. the remove nil doesn't remove the nils from list it just returns a list
;with nils removed. To fix this remove, remove change "lst" in apply to 
;"(remove nil lst)"
(defun summit (lst)
  (apply #'+ (remove nil lst)))

;For b. it is missing the base case when you reach the end of the list. So the if
;needs to be changed to a cond and the condition if at the end of the list needs
;to be added returning 0
(defun summit (lst)
  (cond ((endp lst) 0)
        ((null (car lst)) (summit (cdr lst)))
        (t (+ (car lst) (summit (cdr lst))))))