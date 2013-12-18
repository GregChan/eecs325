(in-package #:shakey-tests)

(defparameter *general-planning-kb*
  '(
    (plan-for ?goal ?goal nil)
    (<- (plan-for ?state1 ?goal (cons ?action ?actions))
        (action-for ?state1 ?goal ?action)
        (results ?state1 ?state2 ?action)
        (plan-for ?state2 ?goal ?actions))
    ))

(defparameter *shakey-1-rules-kb*
  '(
    (results (v1-state ?rloc1 ?box)
             (v1-state ?rloc2 ?box)
             (move-to ?rloc2))
    (results (v1-state ?box1 ?box1)
             (v1-state ?box2 ?box2)
             (push-box ?box1 ?box2))
    (<- (action-for (v1-state hall ?box)
                    (v1-state ?1 ?goalloc)
                    (move-to ?box))
        (different hall ?box)
        (different ?box ?goalloc))
    (<- (action-for (v1-state ?rloc ?box)
                    (v1-state ?1 ?goalloc)
                    (move-to hall))
        (different ?rloc hall)
        (different ?rloc ?box)
        (different ?box ?goalloc))
    (<- (action-for (v1-state hall hall)
                    (v1-state ?1 ?goalloc)
                    (push-box hall ?goalloc)))
    (<- (action-for (v1-state ?box ?box)
                    (v1-state ?1 ?goalloc)
                    (push-box ?box hall))
        (different ?box hall)
        (different ?goalloc ?box))
    ))

(defparameter *room-kb*
  '(
    (-> (different ?x ?y) (different ?y ?x))
    (different room1 room2)
    (different room1 room3)
    (different room1 hall)
    (different room2 hall)
    (different room3 hall)))

(defparameter *shakey-1-kb* (append *shakey-1-rules-kb* *general-planning-kb* *room-kb*))