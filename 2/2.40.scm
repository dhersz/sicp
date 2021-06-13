; Define a procedure unique-pairs that, given an integer n, generates the
; sequence of pairs ( i , j ) with 1 ≤ j < i ≤ n. Use unique-pairs to simplify
; the definition of prime-sum-pairs given above. 

; load 'accumulate'
(load "common.scm")

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low 
            (enumerate-interval 
             (+ low 1) 
             high)))) 

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

; load 'fast-prime?'
(load "1/1.24.scm")

(define (pair-sum? pair)
  (fast-prime? (+ (car pair) (cadr pair))
               100))

(define (make-pair-sum pair)
  (list (car pair) 
        (cadr pair) 
        (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter pair-sum? (unique-pairs n))))
