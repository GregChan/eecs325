(in-package :cs325-user)

(defun position+ (lst &optional temp)
  (if (endp lst) 
  	(reverse temp) 
  	(position+ (cdr lst) (push (+ (car lst) (length temp)) temp))))

(defun position+ (lst)
  (do ((l lst (cdr l))
       (i 0 (1+ i))
       (temp '() (cons (+ (car l) i) temp)))
      ((null l) (reverse temp))))

(defun position+ (lst)
  (let ((i -1))
   (mapcar (lambda (x) (incf i) (+ i x)) lst)))