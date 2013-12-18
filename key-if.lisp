(in-package :cs325-user)

(defmacro key-if (test &rest args)
  (let* ((then (split-after (position ':then args) args))
         (theThen (ldiff (ldiff args then) (ldiff args then)))
         (else (ldiff args theThen)))
    `(cond ,(cons test then) 
           ,(cons t else))))

; (defun parse (exp lst flag)
;   (cond ((eql :then (car exp)) (parse (cdr exp) lst t))
;         ((or (and flag (eql :else (car exp))) (null (car exp))) 
;          (if (null lst) '(nil) (nreverse lst)))
;         (flag (parse (cdr exp) (cons (car exp) lst) flag))
;         (t (parse (cdr exp) lst nil))))

(defun split (pos lst &optional (i 0))
  (if (<= i pos)
      (cons (car lst) (split pos (cdr lst) (+ 1 i)))))

;(split-after (position ':else '(:then a b c d e f g :else a b c d e)) '(:then a b c d e f g :else a b c d e))

;(split (position ':then '(A B C D E F G :ELSE A B C D E)) '(A B C D E F G :ELSE A B C D E))
(defun split-after (pos lst &optional (i 0))
  (cond ((null pos) nil)
        ((<= i pos) (split-after pos (cdr lst) (+ 1 i)) lst)))