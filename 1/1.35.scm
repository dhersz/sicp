; Show that the golden ratio φ (Section 1.2.2) is a fixed point of the
; transformation x -> 1 + 1/x, and use this fact to compute φ by means of the
; fixed-point procedure.

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

(define (func x) (+ 1 (/ 1 x)))

(fixed-point func 1.0)
; 1.61803278688525
