; In case representing pairs as procedures wasn’t mind-boggling enough, consider
; that, in a language that can manipulate procedures, we can get by without
; numbers (at least insofar as nonnegative integers are concerned) by 
; implementing 0 and the operation of adding 1 as
; 
; (define zero (lambda (f) (lambda (x) x)))
; 
; (define (add-1 n)
;   (lambda (f) (lambda (x) (f ((n f) x)))))
; 
; This representation is known as Church numerals, after its inventor, Alonzo
; Church, the logician who invented the λ-calculus.
; 
; Define one and two directly (not in terms of zero and add-1). (Hint: Use
; substitution to evaluate (add-1 zero)). Give a direct definition of the
; addition procedure + (not in terms of repeated application of add-1). 

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This one is really... crazy. 
; So zero is a function that takes an argument and returns a procedure that
; returns its argument. So (zero 3) returns a procedure, ((zero 3) 4) returns 4.
; add-1 is... hard to describe.
;
; Evaluating (add-1 zero):
; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x)))
;
; So (add-1 zero) takes a procedure as argument, and returns a procedure that
; evaluates the input procedure to an argument x.
; So (((add-1 zero) +) 4) is the equivalent of (+ 4).
;
; From the definition of Church numerals in Wikipedia, one is:

(define one (lambda (f) (lambda (x) (f x))))

; Let's see:
; (one +)
; (lambda (x) (+ x))

; Also from Wikipedia:

(define two (lambda (f) (lambda (x) (f (f x)))))

; (two +)
; (lambda (x) (+ (+ x)))

; Ok, I realize now that I may have understood this exercise poorly.
; I think I had to realize that the operation (add-1 zero) returns the procedure
; that one should represent. So then I would have to evaluate (add-1 one) to
; get to two. So let's try doing it:
;
; (add-1 one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))
;
; Which is exactly that defition above. Cool.
;
; Now I have to check what the + operation should do.
; So (plus zero one) should yield one.
; And (plus one one) should yield two.
; And (plus zero zero) should yield zero, for that matter.

(define (plus a b)
  (lambda (f)
    (lambda (x) ((a f) ((b f) x)))))

; (plus a b)
; (plus zero zero)
; (lambda (f) (lambda (x) ((zero f) ((zero f) x))))
; (lambda (f) (lambda (x) (((lambda (x) x) ((zero f) x)))))
; (lambda (f) (lambda (x) ((zero f) x)))
; (lambda (f) (lambda (x) ((lambda (x) x) x)))
; (lambda (f) (lambda (x) x))
; 
; (plus zero one)
; (lambda (f) (lambda (x) ((zero f) ((one f) x))))
; (lambda (f) (lambda (x) (((lambda (x) x) ((one f) x)))))
; (lambda (f) (lambda (x) ((one f) x)))
; (lambda (f) (lambda (x) ((lambda (x) (f x)) x)))
; (lambda (f) (lambda (x) (f x)))
; 
; (plus one zero)
; (lambda (f) (lambda (x) ((one f) ((zero f) x))))
; (lambda (f) (lambda (x) ((lambda (x) (f x)) ((zero f) x))))
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x)))
;
; Seems right?
; 
; Last try
; (plus one one)
; (lambda (f) (lambda (x) ((one f) ((one f) x))))
; (lambda (f) (lambda (x) ((lambda (x) (f x)) ((one f) x)))
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))

