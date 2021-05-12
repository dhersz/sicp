; Louis Reasoner is having great difficulty doing Exercise 1.24. His fast-prime?
; test seems to run more slowly than his prime? test. Louis calls his friend Eva
; Lu Ator over to help. When they examine Louis’s code, they find that he has
; rewritten the expmod procedure to use an explicit multiplication, rather than
; calling square :
; 
; (define (expmod base exp m)
;   (cond ((= exp 0) 1)
;         ((even? exp)
;          (remainder (* (expmod base (/ exp 2) m)
;                        (expmod base (/ exp 2) m))
;                     m))
;         (else
;           (remainder (* base
;                         (expmod base (- exp 1) m))
;                      m))))
; 
; “I don’t see what difference that could make,” says Louis. “I do.” says Eva. 
; “By writing the procedure like that, you have transformed the Θ(log n) process
; into a Θ(n) process.” Explain.

; As Scheme uses applicative-order evaluation to evaluate expressions, it will
; recursively call expmod twice if the procedure is written like so. The process
; generated by such evaluation could then be represented by a recursive tree.
; The runtime order of growth is roughly proportional to the number of nodes in
; such a tree, and the number of nodes is ~2^h, where h is the height of the
; tree. The expmod procedure, in its turn, requires log(n) steps to be
; completed, so the height of its process tree is log(n). We then have that the
; order of growth is roughly 2^(log n) = n.