(defparameter *shakey-1-kb*
  '(
    (<- (v1-state ?x room1) (v1-state ?x ?x))
    (different room1 room2)
    (different room2 room3)
    (different room1 room3)
    ))