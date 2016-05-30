;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; (asdf:oos 'asdf:load-op :positions)
(in-package :cl-user)
(defpackage :server
  (:use :cl :cl-who :hunchentoot :positions)
  (:import-from :hunchentoot
                #:define-easy-handler
                #:easy-acceptor)
  (:export :run-hunchentoot
           :stop-hunchentoot))
(in-package :server)

(defun slurp-stream(stream)
  ;; Credit: http://www.emmett.ca/~sabetts/slurp.html
  (let ((seq (make-string (file-length stream))))
    (read-sequence seq stream)
    seq))

(define-easy-handler (home :uri "/") ()
  (setf (hunchentoot:content-type*) "text/html")
  (with-open-file (stream "../public/index.html" :direction :input)
    (slurp-stream stream)))

(define-easy-handler (hosts-handler :uri "/positions") ()
  (setf (hunchentoot:content-type*) "application/json")
  (format nil "{}"))

(defun run-hunchentoot (&key (port 8080))
  (defvar *default-acceptor* (make-instance 'easy-acceptor :port port
                                            :document-root "public/"))
  (hunchentoot:start *default-acceptor*)
  (format t "~&;; Starting web server on localhost:~A." port))

(defun stop-hunchentoot ()
  (when *default-acceptor*
    (hunchentoot:stop *default-acceptor*)
    (setf *default-acceptor* nil)))


