; Write a procedure to find all ordered triples of distinct positive integers i,
; j, and k less than or equal to a given integer n that sum to a given integer 
; s. 

; load 'flatmap', 'enumerate-interval' and 'filter'
(load "2/2.40.scm")

(define (unique-ordered-pairs low high)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval (+ i 1) high)))
           (enumerate-interval low (- high 1))))

(define (make-ordered-triples n)
  (flatmap (lambda (i)
             (map (lambda (pair) (cons i pair))
                  (unique-ordered-pairs (+ i 1) n)))
           (enumerate-interval 1 (- n 2))))

(define (triples-equal-s n s)
  (define (sums-to-s? triple)
    (= s (accumulate + 0 triple)))
  (filter sums-to-s? (make-ordered-triples n)))
