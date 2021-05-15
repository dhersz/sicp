; Consider the problem of representing line segments in a plane. Each segment is
; represented as a pair of points: a starting point and an ending point. Define
; a constructor make-segment and selectors start-segment and end-segment that
; define the representation of segments in terms of points. Furthermore, a point
; can be represented as a pair of numbers: the x coordinate and the y
; coordinate. Accordingly, specify a constructor make-point and selectors 
; x-point and y-point that define this representation. Finally, using your
; selectors and constructors, define a procedure midpoint-segment that takes a 
; line segment as argument and returns its midpoint (the point whose coordinates
; are the average of the coordinates of the endpoints). To try your procedures,
; you’ll need a way to print points:
; 
; (define (print-point p)
;   (newline)
;   (display "(")
;   (display (x-point p))
;   (display ",")
;   (display (y-point p))
;   (display ")"))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

; Testing
; (define pt (make-point 2 3))
; (print-point pt)
; (2,3)

(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (print-point-nonl p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (print-segment seg)
  (print-point-nonl (start-segment seg))
  (display "---")
  (print-point-nonl (end-segment seg))
  (newline))

; Testing
; (define seg (make-segment (make-point 2 3) (make-point 4 5)))
; (print-segment seg)
; (2,3)---(4,5)

(define (midpoint-segment seg)
  (define (average x y) (/ (+ x y) 2))
  (make-point (average (x-point (start-segment seg))
                       (x-point (end-segment seg)))
              (average (y-point (start-segment seg))
                       (y-point (end-segment seg)))))

; Testing
; (define mid (midpoint-segment seg))
; (print-point mid)
; (3,4)

