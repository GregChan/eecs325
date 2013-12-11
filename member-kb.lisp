(in-package :ddr-tests)

(defparameter *member-kb* 
  '(
    (member ?x (cons ?x ?a))
    (<- (member ?x (cons ?b ?y))
        (member ?x ?y))
    ))