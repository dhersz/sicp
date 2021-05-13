; In 1737, the Swiss mathematician Leonhard Euler published a memoir De
; Fractionibus Continuis, which included a continued fraction expansion for 
; e − 2, where e is the base of the natural logarithms. In this fraction, the
; Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ... ; Write a program that uses your cont-frac procedure from Exercise 1.37 to
; approximate e, based on Euler’s expansion.

; load 'cont-frac'
(load "1/1.37.scm")

(define (euler-exp k)
  (let ((frac 
          (cont-frac (lambda (i) 1.0)
                     (lambda (i) (if (= (remainder i 3) 2)
                                     (* (/ (+ i 1) 3) 2)
                                     1))
                     k)))
    (+ frac 2)))

(euler-exp 1000)
