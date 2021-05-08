; Demonstrate that the Carmichael numbers listed in Footnote 1.47 really do fool
; the Fermat test. That is, write a procedure that takes an integer n and tests
; whether a n is congruent to a modulo n for every a < n, and try your procedure
; on the given Carmichael numbers.

; load 'expmod'
(load "1/1.24.scm")

(define (all-congruent n)
  (define (test a n)
    (cond ((= a 1) #t)
          ((= (expmod a n n) a) (test (- a 1) n))
          (else #f)))
  (test (- n 1) n))

; (all-congruent) returns #t if all a's below n are such that a^n is congruent
; to a modulo n - i.e. they are probably prime.

; Testing it with the numbers of footnote 1.47:
(all-congruent 561)
(all-congruent 1105)
(all-congruent 1729)
(all-congruent 2465)
(all-congruent 2821)
(all-congruent 6601)

; But when using 'prime?' to check for primality:
(load "1/1.22.scm")
(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)

; They are not primes. So they would fool the Fermat test.
