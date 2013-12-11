(in-package :ddr-tests)

(defparameter *member-kb* 
  '(
    (member ?x (cons ?x ?w))
    (<- (member ?x (cons ?z ?y))
        (member ?x ?y))
    ))