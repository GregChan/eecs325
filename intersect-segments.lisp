(defun intersect-segments (x1 y1 x2 y2 x3 y3 x4 y4)
  (let ((v1 (list (- x2 x1) (- y2 y1)))
        (cross-product-denominator (cross-product v1 v2)))))

(defun cross-product (x1 y1 x2 y2 x3 y3 x4 y4)
  (- (* (- x1 x2) (- y3 y4)) (* (- x3 x4) (- y1 y2))))

;(values (+ x1 (* a (- x2 x1))) (+ y1 (* a (- y2 y1))) (+ x3 (* b (- x4 x3))) (+ y3 (* a (- y4 y3))))

(defun cross-product (x1 y1 x2 y2 x3 y3 x4 y4)
  )

; (defun intersect-segments (x1 y1 x2 y2 x3 y3 x4 y4)
;   (let ((a (- (* (- x4 x3) (- y1 y3)) (* (- y4 y3) (- x1 x3))))
;         (b (- (* (- x2 x1) (- y1 y3)) (* (- y2 y1) (- x1 x3))))
;         (c (- (* (- y4 y3) (- x2 x1)) (* (- x4 x3) (- y2 y1)))))
;     (cond ((and (= 0 a) (= 0 b) (= 0 c)) nil)
;           ((and (>= a 0) (<= a 1)) 
;            (values (+ x1 (* a (- x2 x1))) (+ y1 (* a (- y2 y1)))))
;           ((and (>= b 0) (<= b 1))
;            (values (+ x3 (* b (- x4 x3))) (+ y3 (* b (- y4 y3)))))
;           (t (princ "rawr") nil))))

; (defun cross-product (x1 y1 x2 y2 x3 y3 x4 y4)
;   (- (* (- x1 x2) (- y3 y4)) (* (- x3 x4) (- y1 y2))))

; ;(values (+ x1 (* a (- x2 x1))) (+ y1 (* a (- y2 y1))) (+ x3 (* b (- x4 x3))) (+ y3 (* a (- y4 y3))))