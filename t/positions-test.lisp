;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)

(defpackage positions-test
  (:use :cl :positions :fiveam)
  (:export :run-tests))

(in-package :positions-test)

;; No tests right there
(def-suite positions)
(in-suite positions)

(test position-test
  "A simple test"
  (is (equal (length (positions:build-vector 2)) 2)))

(defun run-tests ()
  (5am:run! 'positions))

(run-tests)
