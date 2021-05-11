; a. The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures. Write an 
; analogous procedure called product that returns the product of the values of a
; function at points over a given range. Show how to define factorial in terms
; of product . Also use product to compute approximations to π using the formula
; 52
; 
; (π/4) = (2*4*4*6*6*8...)/(3*3*5*5*7*7...)
; 
; b. If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

; load 'inc' and 'square'
(load "common.scm")

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

; Factorial in terms of product
(define (factorial n)
  (product identity 1 inc n))

; Pi
(define (pi-approx n)
  (define (sum-2 x) (+ x 2))
  (/ (* 4.0 2.0 n (product square 4 sum-2 (- n 1)))
     (product square 3 sum-2 n)))

; A more clever way, copied from the internetz
(define (better-pi n)
  (define (pi-term n)
    (if (even? n) 
        (/ (+ n 2) (+ n 1)) 
        (/ (+ n 1) (+ n 2))))
  (* 4.0 (product pi-term 1 inc n)))

; A recursive product now
(define (rec-product term a next b)
  (if (> a b)
      1
      (* (term a) (rec-product term (next a) next b))))
