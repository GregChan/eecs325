(in-package :cs325-user)

;The critique gives me warnings for "intersect-segments", for "parallel-or-disjoint" for "sort-points" that my code is "a little too long." I'm not sure how to fix this. I feel like my definitions are necessary. Please let me know if they are not. 
(defun intersect-segments (x1 y1 x2 y2 x3 y3 x4 y4)
  (let* ((v1 (list (- x2 x1) (- y2 y1)))
         (v2 (list (- x4 x3) (- y4 y3)))
         (v3 (list (- x1 x3) (- y1 y3)))
         (cross-bottom (cross-product v1 v2)))
    (cond ((= cross-bottom 0) 
           (parallel-or-disjoint x1 y1 x2 y2 x3 y3 x4 y4))
          (t (intersecting x1 y1 v1 v2 v3 cross-bottom)))))

;Determines if two line segments are intersecting. If the segments are intersecting then the function returns the values of the intersection point. If not, the function returns nil.
(defun intersecting (x1 y1 v1 v2 v3 cross-bottom)
  (let* ((a (/ (cross-product v2 v3) cross-bottom))
         (b (/ (cross-product v1 v3) cross-bottom)))
    (cond ((and (between-zero-and-one a) (between-zero-and-one b)) (values (+ x1 (* a (car v1))) (+ y1 (* a (cadr v1)))))
          (t nil))))

;Determines if a number is between zero and one
(defun between-zero-and-one (x)
  (>= 1 x 0))

;Determines if two line segments are parallel or disjoint by using the cross product formula between the two segment vectors. If the two lines overlap, the appropriate overlap is returned. NIL is returned if the lines are disjoint.
(defun parallel-or-disjoint (x1 y1 x2 y2 x3 y3 x4 y4)
  (let ((result (multiple-value-call #'coincident (sort-points x1 y1 x2 y2 x3 y3 x4 y4))))
    (cond ((null result) nil)
          ((eql (slope x1 y1 x2 y2) 'point)
           (if (eql (slope x3 y3 x4 y4) 'point)
               (values-list result)
               (values (car result) (cadr result) (car result) (cadr result))))
          (t (values-list result)))))

;Finds the coincident overlap given two parallel line segments and sorted points. Using the sorted points makes it easier to determine the overlap of the lines. If there is no overlap, returns nil.
(defun coincident (x1 y1 x2 y2 x3 y3 x4 y4)
  (cond ((or (and (>= x2 x3) (<= x2 x4))
             (and (<= x2 x3) (>= x2 x4)))
         (list x2 y2 x3 y3))
        (t nil)))

;Sorts the points so that it is easier to determine the overlap of two line segments. Arranges the list such that the point farthest left in the x direction is closest to the front of the list.
(defun sort-points (x1 y1 x2 y2 x3 y3 x4 y4)
  (cond ((and (<= x1 x2) (<= x3 x4))
         (values x1 y1 x2 y2 x3 y3 x4 y4))
        ((<= x1 x2)
         (values x1 y1 x2 y2 x4 y4 x3 y3))
        ((<= x2 x4)
         (values x2 y2 x1 y1 x3 y3 x4 y4))
        (t (values x2 y2 x1 y1 x4 y4 x3 y3))))

;Takes the cross product of two vectors represented as lists.
(defun cross-product (v1 v2)
  (- (* (car v1) (cadr v2)) (* (car v2) (cadr v1))))

;Finds the slope of the line connecting two points. If the points are the same, the function returns point. If the slope is undefined, the function returns undefined. Otherwise, the slope is calculated.
(defun slope (x1 y1 x2 y2)
  (cond ((and (= x1 x2) (= y1 y2)) 'point)
        ((= x1 x2) 'undefined)
        ((= y1 y2) 0)
        (t (/ (- y1 y2) (- x1 x2)))))