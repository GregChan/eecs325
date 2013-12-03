(in-package :cs325-user)

(defun preceders (x vec)
  (do ((i (1- (length vec)) (1- i))
       (res '() (if (eql x (aref vec i))
                    (adjoin (aref vec (1- i)) res) res)))
      ((<= i 0) res)))

(defun preceders (x vec &key (start 0) (end (1- (length vec))))
  (cond ((>= start end) nil)
        ((eql x (aref vec (1+ start)))
         (adjoin (aref vec start) (preceders x vec :start (1+ start) :end end)))
        (t (preceders x vec :start (1+ start) :end end))))