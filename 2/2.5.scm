; Show that we can represent pairs of nonnegative integers using only numbers
; and arithmetic operations if we represent the pair a and b as the integer that
; is the product 2^a*3^b. Give the corresponding definitions of the procedures
; cons, car, and cdr. 

; load 'fast-expt'
(load "1/1.45.scm")

(define (cons a b) (* (fast-expt 2 a) (fast-expt 3 b)))

(define (car x)
  (define (car-iter val cnt)
    (if (= (remainder val 2) 0)
        (car-iter (/ val 2) (+ cnt 1))
        cnt))
  (car-iter x 0))
  
(define (cdr x)
  (define (cdr-iter val cnt)
    (if (= (remainder val 3) 0)
        (cdr-iter (/ val 3) (+ cnt 1))
        cnt))
  (cdr-iter x 0))
 
