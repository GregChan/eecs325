(in-package :cs325-user)

(defmacro key-if (test &rest args)
  `(cond ,(cons test (parse :then :else args nil nil)) ,(cons t (parse :else :then args nil nil))))

(defun parse (start end exp lst flag)
  (cond ((eql start (car exp)) (parse start end (cdr exp) lst t))
        ((or (and flag (eql end (car exp))) (null (car exp))) 
         (if (null lst) '(nil) (nreverse lst)))
        (flag (parse start end (cdr exp) (cons (car exp) lst) flag))
        (t (parse start end (cdr exp) lst nil))))