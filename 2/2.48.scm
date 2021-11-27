(load "2/2.46.scm")

(define (make-segment vec1 vec2) (cons vec1 vec2))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))
