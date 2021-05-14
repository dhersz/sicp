; We saw in 1.3.3 that attempting to compute square roots by naively finding a
; fixed point of y ↦ x/y does not converge, and that this can be fixed by
; average damping. The same method works for finding cube roots as fixed points
; of the average-damped y ↦ x/y^2. Unfortunately, the process does not work for
; fourth roots — a single average damp is not enough to make a fixed-point 
; search for y ↦ x/y^3 converge. On the other hand, if we average damp twice
; (i.e., use the average damp of the average damp of y ↦ x/y^3) the fixed-point
; search does converge. Do some experiments to determine how many average damps
; are required to compute nth roots as a fixed-point search based upon repeated
; average damping of y ↦ x/y^(n−1). Use this to implement a simple procedure for
; computing nth roots using fixed-point, average-damp, and the repeated
; procedure of Exercise 1.43. Assume that any arithmetic operations you need are
; available as primitives. 

; load 'fixed-point-print'
(load "1/1.36.scm")

; load 'average'
(load "common.scm")

(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(define (average-damp f)
    (lambda (x) 
          (average x (f x))))

(define (nth-root-test x n ntimes)
  (fixed-point-print 
    ((repeated average-damp ntimes) (lambda (y) (/ x (fast-expt y (- n 1)))))
    1.0))

; (nth-root-test 4 31 4)
; After playing around a bit with this, I realize that we need floor(log(n))
; average-damps to converge to a solution, where n is the nth root we want to 
; find, and log is log base 2.
; So the find the square-root you need 1 avg damp, 2 to the 4th-root, 3 to the
; 8th-root, etc.

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (nth-root x n)
  (define ndamps (floor (/ (log n) (log 2))))
  (fixed-point
    ((repeated average-damp ndamps) (lambda (y) (/ x (fast-expt y (- n 1)))))
    1.0))

(nth-root 4 2)
; 2.0
(nth-root 4 127)
; 1.01098044346786
(nth-root 4 128)
; 1.01088928649741
(nth-root-test 32 5)
; 2.00000151299576

