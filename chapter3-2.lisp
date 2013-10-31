(in-package :cs325-user)

(defun stable-union (x y)
  (remove-duplicates (append x y) :from-end t))

(defun stable-intersection (x y)
  (loop for i in x
        when (member i y)
        collect i))

(defun stable-set-difference (x y)
  (loop
    for i in x
    unless (member i y)
    collect i))