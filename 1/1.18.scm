; Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that
; generates an iterative process for multiplying two integers in terms of
; adding, doubling, and halving and uses a logarithmic number of steps.

; load 'double' and 'halve'
(load "1/1.17.scm")

; load 'even?'
(load "1/1.16.scm")

(define (multiter a b)
  (define (iter a b s)
    (cond ((= b 0) s)
          ((even? b) (iter (double a) (halve b) s))
          (else (iter a (- b 1) (+ s a)))))
  (iter a b 0))

; More accurate implementation of Russian peasant multiplication:

(define (peasant a b)
  (define (iter a b s)
    (cond ((= b 0) s)
          ((even? b) (iter (double a) (halve b) s))
          (else (iter (double a) (- (halve b) 0.5) (+ s a)))))
  (iter a b 0))
