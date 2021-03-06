; Simpson’s Rule is a more accurate method of numerical integration than the
; method illustrated above.  Using Simpson’s Rule, the integral of a function f
; between a and b is approximated as
; 
; h/3(y0 + 4y1 + 2y2 + 4y3 + 2y4 + · · · + 2yn−2 + 4yn−1 + yn),
; 
; where h = (b − a)/n, for some even integer n, and yk = f(a + kh).
; (Increasing n increases the accuracy of the approximation.) Define a procedure
; that takes as arguments f, a, b, and n and returns the value of the integral,
; computed using Simpson’s Rule. Use your procedure to integrate cube between 0
; and 1 (with n = 100 and n = 1000), and compare the results to those of the
; integral procedure shown above.

; load 'cube'
(load "common.scm")

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral-simp f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x)
    (+ x (* 2 h)))
  (* (/ h 3.0) (+ (* 4 (sum f (+ a h) add-2h b))
                  (* 2 (sum f (add-2h a) add-2h (- b h)))
                  (f a)
                  (f b))))

; Comparing against (integral)
; (integral-simp cube 0 1 100)
; 0.25
; (integral-simp cube 0 1 1000)
; 0.25
; (integral cube 0 1 0.01)
; 0.2499875
; (integral cube 0 1 0.001)
; 0.249999875000001
