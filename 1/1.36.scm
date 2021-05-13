; Modify fixed-point so that it prints the sequence of approximations it 
; generates, using the newline and display primitives shown in Exercise 1.22. 
; Then find a solution to x^x = 1000 by finding a fixed point of 
; x -> log(1000)/log(x). (Use Scheme’s primitive log procedure, which computes 
; natural logarithms.) Compare the number of steps this takes with and without
; average damping. (Note that you cannot start fixed-point with a guess of 1, as
; this would cause division by log(1) = 0.)

(define (fixed-point-print f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (log-log x) (/ (log 1000) (log x)))

(fixed-point-print log-log 2)
; 2
; 9.96578428466209
; 3.00447220984121
; 6.27919575750716
; 3.75985070240154
; 5.2158437849259
; 4.1822071924014
; 4.82776509834459
; 4.38759338466268
; 4.6712500857639
; 4.48140361689505
; 4.6053657460929
; 4.52308496787189
; 4.57711468204734
; 4.54138248015145
; 4.56490324523083
; 4.54937267930334
; 4.55960649191329
; 4.55285387578827
; 4.55730552974826
; 4.55436906443618
; 4.556305311533
; 4.55502826357355
; 4.55587039670285
; 4.55531500119208
; 4.55568126354333
; 4.55543971573685
; 4.55559900999829
; 4.55549395753139
; 4.55556323729288
; 4.55551754841765
; 4.5555476793064
; 4.55552780851625
; 4.55554091291796
; 4.55553227080365
;
; So 35 iterations.

; Now with average damping.
(define (log-log-avd x)
  (/ (+ x (/ (log 1000) (log x))) 2))

(fixed-point-print log-log-avd 2)
; 2
; 5.98289214233104
; 4.92216872130834
; 4.62822431819546
; 4.56834651313624
; 4.5577305909237
; 4.55590980904513
; 4.55559941161062
; 4.55554655214737
; 4.55553755199982
; 
; Well, that's in fact a bit better.
