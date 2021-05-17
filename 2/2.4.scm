; Here is an alternative procedural representation of pairs. For this
; representation, verify that (car (cons x y)) yields x for any objects x and y.
; 
; (define (cons x y) 
;   (lambda (m) (m x y)))
; 
; (define (car z) 
;   (z (lambda (p q) p)))
; 
; What is the corresponding definition of cdr? (Hint: To verify that this works,
; make use of the substitution model of 1.1.5.) 

(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))

(define pair (cons 1 2))
(car pair)

; What is the corresponding definition of cdr?
(define (cdr z)
  (z (lambda (p q) q)))

(cdr pair)

; Why this works? cons, as defined, returns a call to a variable procedure that
; takes two arguments. car (and cdr), on the other hand, pass a procedure as
; an argument. car returns the first of these two arguments, like car normally
; would return the first element of a pair, while cdr returns the second.
