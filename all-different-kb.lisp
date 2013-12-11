(in-package :ddr-tests)

(defparameter *all-different-kb*
  '(
    (-> (different ?x ?y) (different ?y ?x))
    (-> (all-different (cons ?x (cons ?y ?z))) 
        (all-different (cons ?y ?z))
        (all-different (cons ?x ?z))
        (different ?x ?y))
    ))