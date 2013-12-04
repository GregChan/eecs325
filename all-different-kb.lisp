(in-package :ddr-tests)

(defparameter *all-different-kb*
  '(
    (-> (all-different (cons ?x (cons ?y ?l1))) (different ?x ?y))
    (-> (all-different (cons ?y (cons ?x ?l1))) (different ?x ?y))
    (-> (all-different (cons ?x (cons ?z (cons ?y ?l1)))) (different ?x ?y))
    (-> (all-different (cons ?y (cons ?z (cons ?x ?l1)))) (different ?x ?y))
    (-> (all-different (cons ?z (cons ?x (cons ?y ?l1)))) (different ?x ?y))
    (-> (all-different (cons ?z (cons ?y (cons ?x ?l1)))) (different ?x ?y))
    ))