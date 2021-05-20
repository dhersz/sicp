; Define a constructor make-center-percent that takes a center and a percentage
; tolerance and produces the desired interval. You must also define a selector
; percent that produces the percentage tolerance for a given interval. The
; center selector is the same as the one shown above. 

; load interval stuff
(load "2/2.11.scm")

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))

(define (center i)
  (/ (+ (upper-bound i) (lower-bound i))
     2))

(define (percent i)
  (/ (- (upper-bound i) (center i))
     (center i)))
