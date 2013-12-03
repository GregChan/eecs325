(in-package :cs325-user)

(defun preceders (x vec)
  (if (position x vec))
  (do ((i (position x vec) (position x vec :start (1+ i)))
       (res '() (adjoin (aref vec (1- i)) res))))
      ((null i) res)))

; (defun preceders (x vec &key (start 0) (end (- (length vec) 1)))
;   (cond ((>= start end) nil)
;         ((eql x (aref vec (1+ start)))
;          (adjoin (aref vec start) (preceders x vec :start (1+ start) :end end)))
;         (t (preceders x vec :start (1+ start) :end end))))
