; Louis Reasoner tries to rewrite the first square-list procedure of Exercise
; 2.21 so that it evolves an iterative process:
; 
; (define (square-list items)
;   (define (iter things answer)
;     (if (null? things)
;         answer
;         (iter (cdr things)
;               (cons (square (car things))
;                     answer))))
;   (iter items nil))
; 
; Unfortunately, defining square-list this way produces the answer list in the
; reverse order of the one desired. Why?
; 
; Louis then tries to fix his bug by interchanging the arguments to cons:
; 
; (define (square-list items)
;   (define (iter things answer)
;     (if (null? things)
;         answer
;         (iter (cdr things)
;               (cons answer
;                     (square 
;                      (car things))))))
;   (iter items nil))
; 
; This doesn’t work either. Explain. 

; load 'square'
(load "common.scm")

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

; Because Louis is building the list with cons while placing the answers at the
; car, not at cdr, like in the recursive process. He could either build it with
; append or reverse the list at the end to get the answer straight.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        (cons answer '())
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items '())
  )

; Because that's not the structure of a list. A list is built by sequences of
; elements in car and pointers to subsequent elements in the cdr. Louis is
; building successive pairs over there, with previous pairs in the car and new
; elements in the cdr.
