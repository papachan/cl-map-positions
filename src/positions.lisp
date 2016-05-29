;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
(in-package :cl-user)
(defpackage :positions
  (:use :cl)
  (:export :get-positions :range))
(in-package :positions)

(defun range (max &key (min 0) (step 1))
   (loop for n from min below max by step
      collect n))

(defun transform (a b)
  (let ((r (/ (float 111300) (float 1000)))
        (w (* r (isqrt a)))
        (t (* 2 Pi b)))
    (* w (cos t) (* w (sin t)))))

(defun get-positions ()
  (loop for x in (range 10 :min 0 :step 1)
     do (print (transform (random 1d0) (random 1d0)))))

