; Eva Lu Ator, another user, has also noticed the different intervals computed
; by different but algebraically equivalent expressions. She says that a formula
; to compute with intervals using Alyssa’s system will produce tighter error
; bounds if it can be written in such a form that no variable that represents an
; uncertain number is repeated. Thus, she says, par2 is a “better” program for
; parallel resistances than par1. Is she right? Why? 

; I think she is right, and her reasoning seems to be a bit weird, but it makes
; sense.
;
; That's because when uncertain numbers do not repeat you minimise the number of
; operations that propagate error more quickly, such as divisions and
; multiplications between uncertain numbers.
;
; For example, 1/A + 1/B can be tought as two separate divisions, which will
; have the same proportional tolerance to A and B, and a sum, which will
; result in a tolerance that is the weighted average of the tolerances of 1/A
; and 1/B.
;
; Had you expressed the same expression above as (A*B)/(A+B) you'd have error
; propagating in the numerator (let's assume small proportional tolerances, so
; the sum of A and B tolerances), in the denominator (weighted mean of A and B
; tolerances) and in the division between them (the sum of the numerator and
; denominator tolerances). 
;
; So Eva is right, because if we try to "reduce" the expressions to cases in
; which the uncertain numbers are not repeated we will have error margins 
; propagating more slowly.
