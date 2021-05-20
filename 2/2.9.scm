; The width of an interval is half of the difference between its upper and lower
; bounds. The width is a measure of the uncertainty of the number specified by
; the interval. For some arithmetic operations the width of the result of
; combining two intervals is a function only of the widths of the argument 
; intervals, whereas for others the width of the combination is not a function
; of the widths of the argument intervals. Show that the width of the sum (or
; difference) of two intervals is a function only of the widths of the intervals
; being added (or subtracted). Give examples to show that this is not true for
; multiplication or division. 

; load interval stuff
(load "2/2.8.scm")

(define (width-interval i)
  (/ (- (upper-bound i) (lower-bound i)) 2.0))

; (define i1 (make-interval 3 4))
; (define i2 (make-interval 3 13))
; (define i3 (add-interval i1 i2))
; (width-interval i1)
; 0.5
; (width-interval i2)
; 5.0
; (width-interval i3)
; 5.5
; 
; The width of the sum is the sum of the widths.
; 
; (define i4 (sub-interval i1 i2))
; (width-interval i4)
; 5.5
; 
; Since sub is also defined in terms of add-interval, the same rule applies.
; 
; (define i5 (mul-interval i1 i2))
; (width-interval i5)
; 21.5
; 
; (define i6 (div-interval i1 i2))
; (width-interval i6)
; 0.551282051282051
; 
; Clearly the width of multiplications/divisions are not only a function of the
; width of each operand.
