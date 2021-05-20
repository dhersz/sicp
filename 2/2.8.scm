; Using reasoning analogous to Alyssa’s, describe how the difference of two
; intervals may be computed. Define a corresponding subtraction procedure,
; called sub-interval. 

; load interval stuff
(load "2/2.7.scm")

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))
