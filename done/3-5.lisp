(in-package :cs325-user)

(defun position+ (lst &optional (i 0))
  (if (endp lst) lst
      (cons (+ (car lst) i) (position+ (cdr lst) (1+ i)))))

(defun position+ (lst)
  (do ((l lst (cdr l))
       (i 0 (1+ i))
       (temp '() (cons (+ (car l) i) temp)))
      ((null l) (reverse temp))))

(defun position+ (lst)
  (let ((i -1))
    (mapcar (lambda (x) (+ x (incf i))) lst)))