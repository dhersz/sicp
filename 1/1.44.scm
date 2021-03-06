; The idea of smoothing a function is an important concept in signal processing.
; If f is a function and dx is some small number, then the smoothed version of f
; is the function whose value at a point x is the average of f(x−dx), f(x), and
; f(x+dx). Write a procedure smooth that takes as input a procedure that
; computes f and returns a procedure that computes the smoothed f. It is
; sometimes valuable to repeatedly smooth a function (that is, smooth the
; smoothed function, and so on) to obtain the n-fold smoothed function. Show how
; to generate the n-fold smoothed function of any given function using smooth
; and repeated from Exercise 1.43. 

; load 'repeated'
(load "1/1.43.scm")

; load 'square'
(load "common.scm")

(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

((smooth square) 2)

((smooth square) 2)
; 4.00000000006667

(define (n-smooth f n)
  ((repeated smooth n) f))

((n-smooth square 2) 2)
; 4.00000000013333

