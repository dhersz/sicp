; Ben Bitdiddle, an expert systems programmer, looks over Alyssa’s shoulder and
; comments that it is not clear what it means to divide by an interval that
; spans zero. Modify Alyssa’s code to check for this condition and to signal an
; error if it occurs. 

; load interval stuff
(load "2/2.9.scm")

(define (spans-zero? i)
  (and (<= (lower-bound i) 0) (>= (upper-bound i) 0)))

(define (div-interval x y)
  (if (spans-zero? y) (error "The denominator interval spans zero."))
  (mul-interval x 
                (make-interval 
                 (/ 1.0 (upper-bound y)) 
                 (/ 1.0 (lower-bound y)))))

; (define i1 (make-interval 3 4))
; (define i2 (make-interval -5 5))
; (div-interval i1 i2)
; Error: The denominator interval spans zero.

