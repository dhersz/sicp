(load "2/2.56.scm")

(define (accumulate proc initial elements)
  (if (null? elements)
    initial
    (accumulate proc (proc initial (car elements)) (cdr elements))))

(define (augend s) 
  (accumulate make-sum 0 (cddr s)))

(define (multiplicand p)
  (accumulate make-product 1 (cddr p)))
