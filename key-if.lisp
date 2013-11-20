(in-package :cs325-user)

(defmacro key-if (test &rest args)
  (multiple-value-bind (then else) (parse-then-else args nil nil nil)
                       (list 'cond
                             (if (null then) 
                                 (list test then) 
                                 (cons test then))
                             (if (null else)
                                 (list t else)
                                 (cons t else)))))

(defun parse-between (exp start end lst)
  (cond ((eql end (car exp)) (nreverse lst))
        (t (parse-between (cdr exp) end (cons (car exp) lst)))))

(defun parse-then-else (exp then else flag)
  (cond ((atom exp) (values (nreverse then) (nreverse else)))
        ((eql :then (car exp)) (parse-then-else (cdr exp) then else t))
        ((eql :else (car exp)) (parse-then-else (cdr exp) then else nil))
        ((null flag) (parse-then-else (cdr exp) then (cons (car exp) else) flag))
        (t (parse-then-else (cdr exp) (cons (car exp) then) else flag))))