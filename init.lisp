(in-package :cl-user)

;;; Suggested start up file for EECS 325
;;; Platform: LispWorks on Windows and MacOS

;;; Update History
;;;
;;; 09/23/2011 Clarified comments on directory changing [CKR]

#-quicklisp
(eval-when (:compile-toplevel :load-toplevel :execute)
  (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
    (when (probe-file quicklisp-init)
      (load quicklisp-init))))

(ql:quickload "aserve")
(ql:quickload "webactions")

;;; Load cs325.lisp to create the cs325 package.
(load "~/eecs325/cs325.lisp")
(in-package :cs325-user)