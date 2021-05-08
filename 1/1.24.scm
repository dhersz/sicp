; Modify the timed-prime-test procedure of Exercise 1.22 to use fast-prime? 
; (the Fermat method), and test each of the 12 primes you found in that
; exercise. Since the Fermat test has Θ(log n) growth, how would you expect the
; time to test primes near 1,000,000 to compare with the time needed to test
; primes near 1000? Do your data bear this out? Can you explain any discrepancy
; you find?

(import (chicken time))
(import (chicken random)) ; to use (pseudo-random-integer)

; load 'square'
(load "common.scm")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (pseudo-random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (current-milliseconds) start-time))))

(define (timed-prime-test-3 n)
  (start-prime-test n (current-milliseconds))
  (fast-prime? n 100))

(define (search-for-primes-3 from)
  (define (prime-iter from count)
    (if (< count 3)
        (cond ((timed-prime-test-3 from) (prime-iter (+ from 2) (+ count 1)))
              (else (prime-iter (+ from 2) count)))))
  (if (= (remainder from 2) 0)
      (prime-iter (+ from 1) 0)
      (prime-iter from 0)))

(search-for-primes-3 1000)
(search-for-primes-3 10000)
(search-for-primes-3 100000)
(search-for-primes-3 1000000)
(search-for-primes-3 10000000)
(search-for-primes-3 100000000)
(search-for-primes-3 1000000000)

; Output
; #;43> (search-for-primes-3 1000)
; 1009 *** 6
; 1013 *** 2
; 1019 *** 2
; #;44> (search-for-primes-3 1000)
; 1009 *** 3
; 1013 *** 3
; 1019 *** 2
; #;45> (search-for-primes-3 10000)
; 10007 *** 2
; 10009 *** 2
; 10037 *** 3
; #;46> (search-for-primes-3 100000)
; 100003 *** 4
; 100019 *** 13
; 100043 *** 4
; #;47> (search-for-primes-3 1000000)
; 1000003 *** 3
; 1000033 *** 3
; 1000037 *** 3
; #;48> (search-for-primes-3 10000000)
; 10000019 *** 3
; 10000079 *** 6
; 10000103 *** 3
; #;49> (search-for-primes-3 100000000)
; 100000007 *** 4
; 100000037 *** 5
; 100000039 *** 4
; #;50> (search-for-primes-3 1000000000)
; 1000000007 *** 11
; 1000000009 *** 4
; 1000000021 *** 6
; 
; You'd expect (search-for-primes-3 1000000) to be roughly 2 times faster than
; (search-for-primes-3 1000), since log(1000000)/log(1000) is 2. But since the
; n's are relatively small, some other factors "dominate" the running time, such
; as, for example, the number of random numbers used to make sure that the guess
; is correct (in this case, 100 times). Had if we picked two sufficiently large
; numbers n1 and n2, the relative runtime between them would be log(n1)/log(n2).
