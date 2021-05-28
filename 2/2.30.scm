; Define a procedure square-tree analogous to the square-list procedure of
; Exercise 2.21. That is, square-tree should behave as follows:
; 
; (square-tree
;  (list 1
;        (list 2 (list 3 4) 5)
;        (list 6 7)))
; (1 (4 (9 16) 25) (36 49))
; 
; Define square-tree both directly (i.e., without using any higher-order
; procedures) and also by using map and recursion. 

; load 'square'
(load "common.scm")

(define (square-tree items)
  (cond ((null? items) '())
        ((not (pair? items)) (square items))
        (else (cons (square-tree (car items)) (square-tree (cdr items))))))

(define (square-tree items)
  (map (lambda (x)
         (if (not (pair? x))
             (square x)
             (square-tree x)))
       items))

