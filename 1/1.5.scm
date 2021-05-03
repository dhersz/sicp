; Ben Bitdiddle has invented a test to determine whether the interpreter he is
; faced with is using applicative- order evaluation or normal-order evaluation.
; He defines the following two procedures:
; 
; (define (p) (p))
; (define (test x y)
;   (if (= x 0) 0 y))
; 
; Then he evaluates the expression
; 
; (test 0 (p))
; 
; What behavior will Ben observe with an interpreter that uses
; applicative-order evaluation? What behavior will he observe with an
; interpreter that uses normal-order evaluation? Explain your answer. (Assume
; that the evaluation rule for the special form if is the same whether the
; interpreter is using normal or applicative order: The predicate expression is
; evaluated first, and the result determines whether to evaluate the consequent 
; or the alternative expression.)

(define (p) (p))
(define (test x y) (if (= x 0) 0 y))

; Applicative-order evaluation
; In applicative-order evaluation the arguments passed to a procedure are first
; and all evaluated, and then the procedure itself is applied to these
; arguments. The 'p' function, however, is a recursive function without a
; non-recursive statement. Therefore, (test 0 (p)) in applicative-order gets;
; stuck trying to evaluate the value of (p). 
;
; Normal-order evaluation
; In normal-order evaluation the arguments are first substituted by the
; expressions that define them, and then are evaluated upon reaching primitive 
; functions. The (test 0 (p)) call then leads to (if (= 0 0) 0 (p)). 'if',
; however, is a special form that first evaluates the first argument (= 0 0), 
; and since that evaluates to #t, it returns 0. Were it false, it would also get
; stuck on the (p) loop.
