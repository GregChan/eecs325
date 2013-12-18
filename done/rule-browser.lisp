(in-package #:cs325-user)

(publish :path "/rules" :content-type "text/html" :function 'show-rule-browser)

(defun show-rule-browser (request ent)
  (with-http-response (request ent)
                      (with-http-body (request ent)
                                      (make-rule-page))))

(defun make-rule-page ()
  (html
    (:html
      (:head 
        (:title "Greg's Rule Browser")
        (:body 
          (:center (:h1 "Rule Browser"))
          ((:table border 3)
           (:tr ((:td bgcolor "blue") 
                 ((:font :color "white") "Rule Name")) 
                ((:td bgcolor "blue")
                 ((:font :color "white") "Rule Response")))
           (make-rule-table)))))))

(defun make-rule-table ()
  (do* ((l (get-pattern-names) (cdr l))
        (r (car l) (car l)))
       ((null l))
       (html 
         (:tr (:td (:b (:princ r))) 
              (:td (:princ (car (get-response r))))))))