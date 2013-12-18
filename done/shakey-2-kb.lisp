(in-package #:shakey-tests)

(defparameter *general-plannng-kb*
  '(
    (plan-for ?goal ?goal nil)
    (<- (plan-for ?state1 ?goal (cons ?action ?actions))
        (action-for ?state1 ?goal ?action)
        (results ?state1 ?state2 ?action)
        (plan-for ?state2 ?goal ?actions))
    ))

(defparameter *general-planning-kb*
  '(
    (plan-for (v3-state ?room1 nil room1 ?unlock) nil)
    (<- (plan-for (v2-state ?room3 room1 ?unlock-tmp2)
                  (v2-state ?room1 ?room2 ?unlock) ?action)
        (plan-for (v3-state ?room1 (cons ?room2 ?blocs) room1 ?unlock) ?total)
        (plan-for (v3-state ?room3 ?room4 room1 ?unlock-tmp2) ?actions)
        (append ?action ?actions ?total))
    ))
(defparameter *member-kb*
  '((member ?x (cons ?x ?y))
    (<- (member ?x (cons ?z ?l))
        (member ?x ?l))))

(defparameter *room-kb*
  '(
    (-> (different ?x ?y) (different ?y ?x))
    (different room1 room2)
    (different room1 hall)
    (different room2 hall)))

(defparameter *shakey-2-rules-kb*
  '(
    (results (v2-state ?rloc1 ?bloc ?ul)
             (v2-state ?rloc2 ?bloc ?ul)
             (move-to ?rloc2))

    (results (v2-state ?bloc1 ?bloc1 ?ul)
             (v2-state ?bloc2 ?bloc2 ?ul)
             (push-box ?bloc1 ?bloc2))
 
    (results (v2-state ?rloc ?bloc ?ul)
             (v2-state ?rloc ?bloc (cons ?nloc ?ul))
             (unlock ?nloc))

    (<- (action-for (v2-state hall ?bloc ?ul)
                    (v2-state ?rloc ?gloc ?ul2)
                    (unlock ?bloc))

        (different ?bloc hall)
        (not (member ?bloc ?ul)))

    (<- (action-for (v2-state hall hall ?ul)
                    (v2-state ?rloc ?gloc ?ul2)
                    (unlock ?gloc))
        (not (member ?gloc ?ul)))

    (<- (action-for (v2-state hall ?bloc ?ul)
                    (v2-state ?rloc2 ?gloc ?ul2)
                    (move-to ?bloc))
        (different hall ?bloc)
        (member ?bloc ?ul))

    (<- (action-for (v2-state ?rloc ?bloc ?ul)
                    (v2-state ?rloc2 ?gloc ?ul2)
                    (move-to hall))
        (different ?rloc hall)
        (different ?rloc ?bloc)
        (member ?rloc ?ul))

    (<- (action-for (v2-state hall hall ?ul)
                    (v2-state ?1 ?gloc ?ul2)
                    (push-box hall ?gloc))
        (member ?gloc ?ul))

    (<- (action-for (v2-state ?bloc ?bloc ?ul)
                    (v2-state ?1 ?gloc ?ul2)
                    (push-box ?bloc hall))
        (different ?bloc hall)
        (different ?bloc ?gloc)
        (member ?bloc ?ul))

    ))

(defparameter *shakey-2-kb* (append *shakey-2-rules-kb* *general-planning-kb* *room-kb* *member-kb*))
