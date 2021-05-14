; Several of the numerical methods described in this chapter are instances of an
; extremely general computational strategy known as iterative improvement. 
; Iterative improvement says that, to compute something, we start with an
; initial guess for the answer, test if the guess is good enough, and otherwise
; improve the guess and continue the process using the improved guess as the new
; guess. Write a procedure iterative-improve that takes two procedures as
; arguments: a method for telling whether a guess is good enough and a method
; for improving a guess. Iterative-improve should return as its value a
; procedure that takes a guess as argument and keeps improving the guess until
; it is good enough. Rewrite the sqrt procedure of 1.1.7 and the fixed-point
; procedure of 1.3.3 in terms of iterative-improve. 

; load 'average' and 'square'
(load "common.scm")

(define (iterative-improve ok improve)
  (define (loop x)
    (if (ok x) x (loop (improve x))))
  loop)

(define (sqrt-new x)
  (define (good-enough guess)
    (< (abs (- (square guess) x)) 0.00001))
  (define (improve-guess guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough improve-guess) 1.0))

(sqrt-new 4)
; 2.00000009292229

(define (fixed-point-new f guess)
  (define (good-enough guess)
    (< (abs (- (f guess) guess)) 0.00001))
  (define (improve-guess guess)
    (f guess))
  ((iterative-improve good-enough improve-guess) 1.0))

(fixed-point-new cos 1.0)
; 0.739089341403393

; Could have created a generalised good-enough-proc procedure that takes two
; values and a tolerance, since both functions' are so similar. But well, I'm 
; too lazy right now.
