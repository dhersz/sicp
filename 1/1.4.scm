; Observe that our model of evaluation allows for combinations whose operators 
; are compound expressions. Use this observation to describe the behavior of
; the following procedure:
; (define (a-plus-abs-b a b)
;   ((if (> b 0) + -) a b))

; The outlined procedure sums the absolute of 'b' by summing it to 'a' if its
; value is positive, and subtracting it from 'a' if its value is negative.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

