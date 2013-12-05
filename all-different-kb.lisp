(in-package :ddr-tests)

(defparameter *all-different-kb*
  '(
    (-> (different ?x ?y) (different ?y ?x))
    (-> (all-different (cons ?x (cons ?y ?l1))) (different ?y ?x))
    (-> (all-different (cons ?x (cons ?z (cons ?y ?l1)))) (different ?y ?x))
    (-> (all-different (cons ?z (cons ?x (cons ?y ?l1)))) (different ?y ?x))
    ))