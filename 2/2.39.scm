; Complete the following definitions of reverse (Exercise 2.18) in terms of
; fold-right and fold-left from Exercise 2.38:
; 
; (define (reverse sequence)
;   (fold-right 
;    (lambda (x y) ⟨??⟩) nil sequence))
; 
; (define (reverse sequence)
;   (fold-left 
;    (lambda (x y) ⟨??⟩) nil sequence))

; load 'fold-right' and 'fold-left'
(load "2/2.38.scm")

(define (reverse sequence)
  (fold-right 
   (lambda (x y) (append y (list x))) '() sequence))

(define (reverse sequence)
  (fold-left 
   (lambda (x y) (cons y x)) '() sequence))
