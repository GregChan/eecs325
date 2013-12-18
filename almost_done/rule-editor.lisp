(in-package #:cs325-user)
(use-package :net.aserve)
(use-package :net.html.generator)

(publish :path "/rules/" :content-type "text/html" :function 'show-rule-browser)
(publish :path "/rules/critic/edit" :content-type "text/html" :function 'show-edit-page)

(defun show-rule-browser (request ent)
  (with-http-response (request ent)
                      (with-http-body (request ent)
                                      (make-rule-page))))
(defun show-edit-page (request ent)
  (with-http-response (request ent)
                      (with-http-body (request ent)
                                      (make-edit-page (request-query-value "rule" request)))))

(defun make-edit-page(rule)
  (let ((r (intern rule "CS325-USER")))
    (html
      (:html
        (:title "Rule Editor")
        (:body
          (:center
            ((:form :action "/rules/critic/edit" :method "GET")
             (:h1 "Rule Editor")
             ((:table border 3)
              (:tr (:td "Name") (:td ((:textarea) (:princ rule))))
              (:tr (:td "Pattern") (:td ((:textarea) (:princ (get-pattern r)))))
              (:tr (:td "Response Format String") (:td ((:textarea) (:princ (car (get-response r))))))
              (:tr (:td "Response Format Arguments") (:td ((:textarea) ())))))
            ((:input :type "Submit" :value "Save"))
            ((:input :type "Submit" :value "Run Lisp Critic"))))))))

(defun make-rule-page ()
  (html
    (:html
      (:head 
        (:title "Rule Browser")
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
        (r (car l) (car l))
        (str (concatenate 'string "/rules/critic/edit?rule=" (query-to-form-urlencoded (list (list (string r))))) 
             (concatenate 'string "/rules/critic/edit?rule=" (query-to-form-urlencoded (list (list (string r)))))))
       ((null l))
       (html 
         (:tr (:td ((:a href str) (:princ r))) 
              (:td (:princ (car (get-response r))))))))