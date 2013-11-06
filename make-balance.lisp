(in-package :cs325-user)

;The critic warns about about redefining input variables, but I think it is necessary in order to produce the functionality described in the exercise.

(defun make-balance (x)
  #'(lambda (&optional y)
     (if (null y)
         x
         (incf x y))))