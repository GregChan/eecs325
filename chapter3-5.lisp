(in-package :cs325-user)

(defun position+ (lst &optional temp)
  (if (endp lst)) (reverse lst) (position+ (cdr lst) (push temp)))

; (defun position+ (lst)
;   (do ((l lst (cdr l))
;        (i 0 (1+ i))
;        (temp '() (cons (+ (car l) i) temp)))
;       ((null l) (reverse temp))))