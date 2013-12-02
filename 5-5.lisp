(in-package :cs325-user)

(defun preceders (x vec)
  (do ((i (position x vec) (position x vec :start (1+ i)))
       (res '() (when (> i 0) (adjoin (aref vec (1- i)) res))))
      ((null i) res)))

(defun preceders (x vec)
  (cond ((<= (length vec) 1) nil)
        ((eql x (aref vec 1)) 
         (remove-duplicates (cons (aref vec 0) (preceders x (subseq vec 1)))))
        (t (preceders x (subseq vec 1)))))
