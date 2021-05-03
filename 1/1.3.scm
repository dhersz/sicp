; Define a procedure that takes three numbers as arguments and returns the sum
; of the squares of the two larger numbers.

; load 'square' procedure
(load "common.scm")

(define (sum_2_largest_sqrs x y z)
  (define lowest
    (cond ((and (< x y) (< x z)) x)
          ((and (< y x) (< y z)) y)
          (else z)
    )
  )
  (- (+ (square x) (square y) (square z)) 
     (square lowest)
  )
)

