;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)

(defpackage positions-test
  (:use :cl :positions :fiveam)
  (:export :run-tests))

(in-package :positions-test)

;; No tests right there

(defun run-tests ()
  )

(run-tests)
