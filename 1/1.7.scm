; The good-enough? test used in computing square roots will not be very
; effective for finding the square roots of very small numbers. Also, in real 
; computers, arithmetic operations are almost always performed with limited
; precision. This makes our test inadequate for very large numbers. Explain
; these statements, with examples showing how the test fails for small and large
; numbers. An alternative strategy for implementing good-enough? is to watch how
; guess changes from one iteration to the next and to stop when the change is a
; very small fraction of the guess. Design a square-root procedure that uses
; this kind of end test. Does this work beer for small and large numbers?

; load 'square'
(load "common.scm")

; load all procedures related to previous exercise
(load "1/1.6.scm")

; The 0.001 tolerance is relatively high to very small numbers, so estimates get 
; less precise when dealing with them. For example, the square-root of 0.0001 is
; 0.01, but evaluating (sqrt 0.0001) returns 0.0323 (an error of ~223%).
(sqrt 0.0001)
(/ (- (sqrt 0.0001) 0.01) 0.01)

; This very same tolerance, however, is too small for very large numbers. The 
; larger the number, the less precisely the computer is able to represent it. So
; when dealing with very large numbers the computer is not able to get an
; estimate that suffices the set tolerance, and eventually gets stuck in the
; 'sqrt-iter' procedure. Evaluating (sqrt 1000000000000) returns 1000000.0, but
; (sqrt 10000000000000) never finishes.
(sqrt 1000000000000)

; The following procedures allow us which number is used as a guess.
(define (v-improve guess x)
  (print (average guess (/ x guess)))
  (average guess (/ x guess)))

(define (v-sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (v-sqrt-iter (v-improve guess x) x)))

(define (v-sqrt x)
  (v-sqrt-iter 1.0 x))

; We can see that (v-sqrt 10000000000000) gets stuck in the 3162277.66016838 
; guess.
; (abs (- (square guess) x)) evaluates to 0.00390625 (> 0.001)
; (improve 3162277.66016838 10000000000000) also evaluates to 3162277.66016838,
; so the 'sqrt-iter' gets stuck due to lost of precision
(abs (- (square 3162277.66016838) 10000000000000))
(improve 3162277.66016838 10000000000000)

; A better good-enough?
; If the improved guess changes less than 0.01%, then it's good enough.
(define (bt-good-enough? guess improved-guess)
  (< (abs (/ (- improved-guess guess) guess)) 0.0001)
)

(define (vb-sqrt-iter guess x)
  (if (bt-good-enough? guess (improve guess x))
      guess
      (vb-sqrt-iter (v-improve guess x) x)
  )
)

(define (vb-sqrt x)
  (vb-sqrt-iter 1.0 x)
)

; And that really works better, both for very low and for very high numbers.
; (vb-sqrt 0.0001)
; (vb-sqrt 10000000000000)
