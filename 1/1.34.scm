; Suppose we define the procedure
; 
; (define (f g) (g 2))
; 
; Then we have
; 
; (f square)
; 4
; (f (lambda (z) (* z (+ z 1))))
; 6
; 
; What happens if we (perversely) ask the interpreter to evaluate the 
; combination (f f)? Explain.

; f will recursively call argument with 2 passed as an argument. Then it will
; try to evaluate (2 2), but 2 is not a procedure, which will result in an
; error.
