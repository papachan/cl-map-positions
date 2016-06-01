;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
(in-package :cl-user)
(defpackage :positions
  (:use :cl :jsown)
  (:export
   :build-vector
   :to-output))
(in-package :positions)

(defun transform-coord (u v)
  (let ((w)
        (x)
        (r (/ (float 111300) (float 1000))))
    (setf w (* r (sqrt u)))
    (setf x (* 2 Pi v))
    (values
     (* w (cos x))
     (* w (sin x)))))

(defun get-random-coord (max)
  (loop repeat max
     collect (read-from-string (format nil "~,5@F" (* .1 (random 1d0))))))

(defun rand ()
  (read-from-string
   (format nil "~,5@F" (* .1 (random 1d0)))))

;; generate a new vector
(defun build-vector (max)
  (loop repeat max
     collect
       (vector (- 4.72 (rand))
               (- -74.04 (rand)))))

(defun get-rand-positions (count)
  (let ((old)
        (result))
    (loop for x in (get-random-coord (* 2 count))
       do
         (setf old x)
         (push (transform-coord x old) result))
    result))

;; result calling from Ajax
(defun to-output ()
  (jsown:to-json (build-vector 40)))

(defvar *my-vec* (build-vector 20))
(print (jsown:to-json *my-vec*))
