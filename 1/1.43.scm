; If f is a numerical function and n is a positive integer, then we can form the
; nth repeated application of f, which is defined to be the function whose 
; value at x is f(f(…(f(x))…)). For example, if f is the function x ↦ x + 1, 
; then the nth repeated application of f is the function x ↦ x + n. If f is the
; operation of squaring a number, then the nth repeated application of f is the
; function that raises its argument to the 2^nth power. Write a procedure that 
; takes as inputs a procedure that computes f and a positive integer n and
; returns the procedure that computes the nth repeated application of f. Your 
; procedure should be able to be used as follows:
; 
; ((repeated square 2) 5)
; 625
; 
; Hint: You may find it convenient to use compose from Exercise 1.42. 

; load 'square'
(load "common.scm")

; load 'compose'
(load "1/1.42.scm")

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

((repeated square 2) 5)
; 625

((repeated square 3) 5)
; 390625

((repeated inc 10) 5)
; 15
