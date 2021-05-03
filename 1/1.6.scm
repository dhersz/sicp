; Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. 
; “Why can’t I just define it as an ordinary procedure in terms of cond ?” she
; asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she
; defines a new version of if :
; 
; (define (new-if predicate then-clause else-clause)
;   (cond (predicate then-clause)
;         (else else-clause)))
; 
; Eva demonstrates the program for Alyssa:
; 
; (new-if (= 2 3) 0 5)
; 5
; (new-if (= 1 1) 0 5)
; 0
; 
; Delighted, Alyssa uses new-if to rewrite the square-root program:
; 
; (define (sqrt-iter guess x)
;   (new-if (good-enough? guess x)
;           guess
;           (sqrt-iter (improve guess x) x)))
; 
; What happens when Alyssa aempts to use this to compute square roots? Explain.

; load 'square' procedure
(load "common.scm")

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x) x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

; As Scheme uses applicative-order evaluation, when using the 'new-if' procedure
; inside 'sqrt-iter' the recursive clause will always be evaluated, even if
; 'good-enough?' eventually evaluates to #t, therefore leading to a never ending
; loop. When using the built-in 'if', however, when 'good-enough?' evaluates to
; #t only the true-statement, which is not recursive, will be evaluated,
; therefore ending the loop.
