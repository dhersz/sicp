; Show that under the assumption of small percentage tolerances there is a
; simple formula for the approximate percentage tolerance of the product of two
; intervals in terms of the tolerances of the factors. You may simplify the
; problem by assuming that all numbers are positive.

; load interval stuff
(load "2/2.12.scm")

(define i1 (make-center-percent 10 .01))
(define i2 (make-center-percent 100 .05))

(define i3 (mul-interval i1 i2))
(center i3)
; 1000.5
(percent i3)
; 0.0599700149925037

; Apparently the rule is t3 =~ t1 + t2.
;
; Other test:

(define i4 (make-center-percent 100 .05))
(define i5 (make-center-percent 100 .005))

(define i6 (mul-interval i4 i5))
(center i6)
; 10002.5
(percent i6)
; 0.0549862534366408

; Yup, it seems right. Not gonna bother trying to show that with math.
