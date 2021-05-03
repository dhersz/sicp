; Newton’s method for cube roots is based on the fact that if y is an
; approximation to the cube root of x, then a better approximation is given by
; the value
; 
; ((x/y^2) + 2y) / 3
; 
; Use this formula to implement a cube-root procedure analogous to the 
; square-root procedure.

(define (cube x) (* x x x))

; load 'square'
(load "common.scm")

(define (improve-cube guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)

; load 'bt-good-enough?' (also loads "common.scm" inside it, but anyway)
(load "1/1.7.scm")

(define (cb-iter guess x)
  (if (bt-good-enough? guess (improve-cube guess x))
      guess
      (cb-iter (improve-cube guess x) x)
  )
)

(define (cbrt x)
  (cb-iter 1.0 x)
)
