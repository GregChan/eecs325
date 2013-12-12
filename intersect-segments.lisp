(in-package :cs325-user)

(defun intersect-segments (x1 y1 x2 y2 x3 y3 x4 y4)
  (let* ((v1 (list (- x2 x1) (- y2 y1)))
         (v2 (list (- x4 x3) (- y4 y3)))
         (v3 (list (- x1 x3) (- y1 y3)))
         (cross-bottom (cross-product v1 v2)))
    (cond ((= cross-bottom 0) 
           (parallel-intersection x1 y1 x2 y2 x3 y3 x4 y4))
          (t (non-parallel-intersection x1 y1 v1 v2 v3 cross-bottom)))))

;Determines if two line segments are intersecting. If the segments are intersecting then the function returns the values of the intersection point. If not, the function returns nil.
(defun non-parallel-intersection (x1 y1 v1 v2 v3 cross-bottom)
  (let* ((a (/ (cross-product v2 v3) cross-bottom))
         (b (/ (cross-product v1 v3) cross-bottom)))
    (and (>= 1 a 0) (>= 1 b 0) (values (+ x1 (* a (car v1))) (+ y1 (* a (cadr v1)))))))

;Determines if two line segments are parallel or disjoint by using the cross product formula between the two segment vectors. If the two lines overlap, the appropriate overlap is returned. NIL is returned if the lines are disjoint.
(defun parallel-intersection (x1 y1 x2 y2 x3 y3 x4 y4)
  (let ((result (coincident x1 y1 x2 y2 x3 y3 x4 y4)))
    (cond ((null result) nil)
          ((or (eql (slope x1 y1 x2 y2) 'point) (eql (slope x3 y3 x4 y4) 'point))
               (values (car result) (cadr result) (car result) (cadr result)))
          (t (values-list result)))))

;Finds the coincident overlap given two parallel line segments. If there is no overlap return nil.
(defun coincident (x1 y1 x2 y2 x3 y3 x4 y4)
  (let ((start (max x1 x2))
        (end (min x3 x4))
        (bound (max x3 x4)))
    (if (>= start end)
        (list start (max y1 y2) end (min y3 y4))
        nil)))

;Takes the cross product of two vectors represented as lists.
(defun cross-product (v1 v2)
  (- (* (car v1) (cadr v2)) (* (car v2) (cadr v1))))

;Finds the slope of the line connecting two points. If the points are the same, the function returns point. If the slope is undefined, the function returns undefined. Otherwise, the slope is calculated.
(defun slope (x1 y1 x2 y2)
  (cond ((and (= x1 x2) (= y1 y2)) 'point)
        ((= x1 x2) 'undefined)
        ((= y1 y2) 0)
        (t (/ (- y1 y2) (- x1 x2)))))