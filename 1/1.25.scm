; Alyssa P. Hacker complains that we went to a lot of extra work in writing
; expmod. After all, she says, since we already know how to compute
; exponentials, we could have simply written
; 
; (define (expmod base exp m)
;   (remainder (fast-expt base exp) m))
; 
; Is she correct? Would this procedure serve as well for our fast prime tester?
; Explain.

; She is correct in the sense that both would return the same results.
; However, due to how the procedures are structured, they will behave very
; differently. The fast-exp procedure computes the whole exponential and then
; calculates the remainder. If this exponential is a very large number, then
; scheme will have to resort to representations of numbers that consume a lot of
; memory and which require a lot of time to make operations with.
; The original expmod, on the other hand, maintains the exponentials relatively
; low all the way until the end of the evaluation, since these exponential are
; constanly getting modulo'd. Thus the operations with such smaller numbers are
; less computationally expensive, which means that they tend to be less memory
; hungry and faster.
