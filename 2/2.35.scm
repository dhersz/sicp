; Redefine count-leaves from 2.2.2 as an accumulation:
; 
; (define (count-leaves t)
;   (accumulate ⟨??⟩ ⟨??⟩ (map ⟨??⟩ ⟨??⟩)))

; load 'accumulate'
(load "common.scm")

(define (count-leaves t)
  (accumulate
    +
    0
    (map (lambda (x) (if (or (pair? x) (null? x))
                         (length x) 
                         1))
         t)))
