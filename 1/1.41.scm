; Define a procedure double that takes a procedure of one argument as argument
; and returns a procedure that applies the original procedure twice. For 
; example, if inc is a procedure that adds 1 to its argument, then (double inc)
; should be a procedure that adds 2. What value is returned by
; 
; (((double (double double)) inc) 5)

(define (double f)
  (lambda (x)
    (f (f x))))

; (((double (double double)) inc) 5) should return 21.
; (((double (g (g))) inc) 5)    - g here is double f
; (((h (h)) inc) 5)             - h here is (double (double f))
; (((double (double (double (double inc))))) 5)
; 4 times doubled = adds 2^4 = 16

; load 'inc'
(load "common.scm")

(((double (double double)) inc) 5)
; 21

; Checking if I got it. Would I add another double in the front, it would add
; 2^8 = 256, to a result of 261.
(((double (double (double double))) inc) 5)
; 261
