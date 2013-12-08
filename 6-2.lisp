(in-package :cs325-user)

(defun bin-search (x vec &key (start 0) (end (length vec)) (key #'identity))
  (if (<= end start) 
      nil
      (let* ((mid (floor (+ end start) 2))
             (element (aref vec mid))
             (x2 (funcall key element)))
        (cond ((< x x2) (bin-search x vec :start start :end mid :key key))
              ((> x x2) (bin-search x vec :start (1+ mid) :end end :key key))
              (t element)))))