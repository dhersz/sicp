; The smallest-divisor procedure shown at the start of this section does lots of
; needless testing: After it checks to see if the number is divisible by 2 there
; is no point in checking to see if it is divisible by any larger even numbers. 
; This suggests that the values used for test-divisor should not be 2, 3, 4, 5,
; 6, . . ., but rather 2, 3, 5, 7, 9, . . ..  To implement this change, define a
; procedure next that returns 3 if its input is equal to 2 and otherwise returns
; its input plus 2. Modify the smallest-divisor procedure to use (next 
; test-divisor) instead of (+ test-divisor 1). With timed-prime-test 
; incorporating this modified version of smallest-divisor , run the test for
; each of the 12 primes found in Exercise 1.22. Since this modification halves
; the number of test steps, you should expect it to run about twice as fast. Is
; this expectation confirmed? If not, what is the observed ratio of the speeds
; of the two algorithms, and how do you explain the fact that it is different
; from 2?

(import (chicken time))

; load 'square'
(load "common.scm")

(define (smallest-divisor-2 n) 
  (define (next x)
    (if (= x 2) 3 (+ x 2)))
  (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
            ((= (remainder test-divisor n) 0) test-divisor)
            (else (find-divisor n (next test-divisor)))))
  (find-divisor n 2))

(define (prime2? n)
  (= n (smallest-divisor-2 n)))

(define (timed-prime-test-2 n)
  (start-prime-test n (current-milliseconds))
  (prime2? n))
(define (start-prime-test n start-time)
  (if (prime2? n)
      (report-prime n (- (current-milliseconds) start-time))))
(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes-2 from)
  (define (prime-iter from count)
    (if (< count 3)
        (cond ((timed-prime-test-2 from) (prime-iter (+ from 2) (+ count 1)))
              (else (prime-iter (+ from 2) count)))))
  (if (= (remainder from 2) 0)
      (prime-iter (+ from 1) 0)
      (prime-iter from 0)))

(search-for-primes-2 1000)
(search-for-primes-2 10000)
(search-for-primes-2 100000)
(search-for-primes-2 1000000)
(search-for-primes-2 10000000)
(search-for-primes-2 100000000)
(search-for-primes-2 1000000000)

; Output
; #;20> (search-for-primes-2 1000)
; 1001 *** 0                                                      
; 1003 *** 0           
; 1005 *** 0
; #;21> (search-for-primes-2 10000)
; 10001 *** 0
; 10003 *** 0
; 10005 *** 0
; #;22> (search-for-primes-2 100000)
; 100001 *** 0
; 100003 *** 0
; 100005 *** 0
; #;23> (search-for-primes-2 1000000)
; 1000001 *** 1
; 1000003 *** 0
; 1000005 *** 0
; #;24> (search-for-primes-2 10000000)
; 10000001 *** 2
; 10000003 *** 1
; 10000005 *** 1
; #;25> (search-for-primes-2 100000000)
; 100000001 *** 5
; 100000003 *** 6
; 100000005 *** 5
; #;26> (search-for-primes-2 1000000000)
; 1000000001 *** 23
; 1000000003 *** 15
; 1000000005 *** 19
;
; Some of them are roughly half of what they used to be, some are larger than
; this, and some others are smaller. I have only run each test once though, and
; the runtime of these expressions is subject to many variable effects, such as 
; other processes running in the background, how the interpreter manages the
; evaluation of the expressions, etc. So they should all roughly be half of what
; they used to be, but some variance is expected.
