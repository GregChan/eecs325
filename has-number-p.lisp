(in-package :cs325-user)

(defun has-number-p (x)
  (if (atom x)
      (numberp x)
      (some #'has-number-p x)))