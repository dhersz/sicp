; Define a procedure cubic that can be used together with the newtons-method
; procedure in expressions of the form
; 
; (newtons-method (cubic a b c) 1)
; 
; to approximate zeros of the cubic x^3 + ax^2 + bx + c.

; load 'fixed-point'
(load "1/1.35.scm")

; load 'cube' and 'square'
(load "common.scm")

(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) 
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) 
               guess))

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

(newtons-method (cubic 1 1 1) 1)
; -0.99999999999978

