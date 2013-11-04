(in-package :cs325-user)

(defun my-copy-list (lst)
  (reduce #'cons lst :from-end t :initial-value '()))

(defun my-reverse (lst)
  (reduce #'(lambda (x y) (cons y x)) lst :initial-value '()))

(defun hash-table->alist (tbl)
  (let ((alst nil))
    (maphash #'(lambda (x y) (setf alst (acons x y alst))) tbl)
    alst))

(defun alist->hash-table (alst)
  (let ((tbl (make-hash-table)))
    (do ((l alst (rest l)))
        ((null l) tbl)
        (setf (gethash (car (car l)) tbl) (cdr (car l))))))