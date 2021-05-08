; Most Lisp implementations include a primitive called runtime that returns an
; integer that specifies the amount of time the system has been running
; (measured, for example, in microseconds). The following timed-prime-test 
; procedure, when called with an integer n, prints n and checks to see if n is
; prime. If n is prime, the procedure prints three asterisks followed by the
; amount of time used in performing the test.  
; 
; (define (timed-prime-test n)
;   (newline)
;   (display n)
;   (start-prime-test n (runtime)))
; (define (start-prime-test n start-time)
;   (if (prime? n)
;       (report-prime (- (runtime) start-time))))
; (define (report-prime elapsed-time)
;   (display " *** ")
;   (display elapsed-time))
; 
; Using this procedure, write a procedure search-for-primes that checks the
; primality of consecutive odd integers in a specified range. Use your procedure
; to find the three smallest primes larger than 1000; larger than 10,000; larger
; than 100,000; larger than 1,000,000. Note the time needed to test each prime. 
; Since the testing algorithm has order of growth of Θ(sqrt(n)), you should
; expect that testing for primes around 10,000 should take about sqrt(10) times
; as long as testing for primes around 1000. Do your timing data bear this out?
; How well do the data for 100,000 and 1,000,000 support the Θ(sqrt(n)) 
; prediction? Is your result compatible with the notion that programs on your 
; machine run in time proportional to the number of steps required for the
; computation?

; load 'smallest-divisor' stuff
(load "1/1.21.scm")

(define (prime? n)
  (= n (smallest-divisor n)))

; chicken implementation does not include (runtime), but includes some timing
; functions in the (chicken time) module
(import (chicken time))

; adapting (timed-prime-test) for better display and to to save some lines of 
; code in (search-from-primes)
(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds))
  (prime? n))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (current-milliseconds) start-time))))
(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes from)
  (define (prime-iter from count)
    (if (< count 3)
        (cond ((timed-prime-test from) (prime-iter (+ from 2) (+ count 1)))
              (else (prime-iter (+ from 2) count)))))
  (if (= (remainder from 2) 0)
      (prime-iter (+ from 1) 0)
      (prime-iter from 0)))

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 1000000)
(search-for-primes 10000000)
(search-for-primes 100000000)
(search-for-primes 1000000000)

; Output is below:
; #;73> (search-for-primes 1000)
; 1009 *** 0
; 1013 *** 0
; 1019 *** 0
; #;74> (search-for-primes 10000)
; 10007 *** 0
; 10009 *** 1
; 10037 *** 0
; #;75> (search-for-primes 100000)
; 100003 *** 1
; 100019 *** 1
; 100043 *** 1
; #;76> (search-for-primes 1000000)
; 1000003 *** 1
; 1000033 *** 1
; 1000037 *** 1
; #;77> (search-for-primes 10000000)
; 10000019 *** 3
; 10000079 *** 4
; 10000103 *** 4
; #;78> (search-for-primes 100000000)
; 100000007 *** 14
; 100000037 *** 11
; 100000039 *** 11
; #;79> (search-for-primes 1000000000)
; 1000000007 *** 35
; 1000000009 *** 28
; 1000000021 *** 27
;
; sqrt(10) = 3.16
; The runtime estimates are too low up until around n=1000000, so it's hard to
; measure differences with them. From this point onwards, though, the runtime
; estimates between two consecutive orders of magnitude of n are roughly 
; multiplied by 3, which is around sqrt(10). So we can say that runtime is
; proportional to the number of steps required to compute the expression.
