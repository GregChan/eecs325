(in-package :ddr-tests)

(defparameter *member-kb* 
  '(
    (member ?x (cons ?x ?l1))
    (member ?x (cons ?y (cons ?x ?l2)))
    (member ?x (cons ?y (cons ?z (cons ?x ?l3))))
    ))