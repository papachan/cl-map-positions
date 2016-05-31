;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
(in-package :cl-user)
(defpackage :positions
  (:use :cl)
  (:export :get-positions :range))
(in-package :positions)

(defun get-random-coord (max)
  (loop repeat max
     collect (format nil "~,5@F" (random 1d0))))

(defun transform-coord (u v)
  (let ((w nil)
        (x nil)
        (r (/ (float 111300) (float 1000))))
    (setf w (* r (sqrt u)))
    (setf x (* 2 Pi v))
    (values
     (* w (cos x))
     (* w (sin x)))))

(defun get-positions ()
  (loop for x in (get-random-coord 3)
     do
       (print (read-from-string x))))
