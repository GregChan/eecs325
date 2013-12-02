(in-package :cs325-user)

(defun horner (x &rest coefficients)
  (reduce #'(lambda (coef1 coef2)
             (+ (* coef1 x) coef2))
          coefficients))