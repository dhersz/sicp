; The sine of an angle (specified in radians) can be computed by making use of
; the approximation sin x ≈ x if x is sufficiently small, and the trigonometric
; identity
; 
; sin x = 3 sin(x/3) − 4 (sin(x/3))^3
; 
; to reduce the size of the argument of sin. (For purposes of this exercise an
; angle is considered “sufficiently small” if its magnitude is not greater than
; 0.1 radians.) These ideas are incorporated in the following procedures:
; 
; (define (cube x) (* x x x))
; (define (p x) (- (* 3 x) (* 4 (cube x))))
; (define (sine angle)
;   (if (not (> (abs angle) 0.1))
;       angle
;       (p (sine (/ angle 3.0)))))
; 
; a. How many times is the procedure p applied when (sine 12.15) is evaluated?
; b. What is the order of growth in space and number of steps (as a function of
; a) used by the process generated by the sine procedure when (sine a) is
; evaluated?

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; a.
; (sine 12.15)
; (p (sine 4.05))
; (p (p (sine 1.35)))
; (p (p (p (sine 0.45))))
; (p (p (p (p (sine 0.15)))))
; (p (p (p (p (p (sine 0.05))))))
; (p (p (p (p (p 0.05)))))
; (p (p (p (p 0.1495))))
; (p (p (p 0.43513)))
; (p (p 0.97584))
; (p -0.78956)
; -0.39980
; p is evaluated 5 times
;
; b.
; space and time -> O(log n)