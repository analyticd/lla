;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-
(in-package :lla-unit-tests)
(in-readtable lla:v-syntax)

(deftestsuite adjustable-tests (lla-unit-tests)
  ()
  (:dynamic-variables 
   (*lift-equality-test* t))
  :equality-test #'x=)

(addtest (adjustable-tests)
  adjustable-numeric-vector
  (let ((v #v(1 2 3 4))
        (anv (make-anv :double 0 :default-expansion 0))
        (*lift-equality-test* #'x=))
    (add anv v)
    (ensure-same v anv)
    (ensure-same 4 (capacity anv))
    (setf (capacity anv t) 2)
    (ensure-same 6 (capacity anv))
    (setf (size anv t) -3)
    (ensure-same anv #v(1))
    (shrink anv)
    (ensure-same 1 (capacity anv))
    (add anv #v(7 8 9))
    (add anv 11d0)
    (ensure-same anv #v(1 7 8 9 11))))

(addtest (adjustable-tests)
  row-adjustable-matrix
  (let ((m #2v(1 2 3 4))
        (a #v(5 6))
        (b #2v(7 8 9 10))
        ;; ncol=1 is deliberate
        (ram (make-ra-matrix :double 0 1))
        (*lift-equality-test* #'x=))
    (add ram m)
    (ensure-same ram m)
    (add ram b)
    (ensure-same ram (stack-vertically m b) :test #'x=)
    (setf (size ram t) (- (xdim b 1)))
    (ensure-same ram m)
    (ensure-same (capacity ram) (+ (xdim m 1) (xdim b 1)))
    (shrink ram)
    (ensure-same ram m)
    (ensure-same (capacity ram) (xdim m 1))
    (add ram a)
    (ensure-same ram (stack-vertically m a))
    (ensure-same (capacity ram) (1+ (xdim m 1)))))


