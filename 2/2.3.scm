; Implement a representation for rectangles in a plane. (Hint: You may want to
; make use of Exercise 2.2.) In terms of your constructors and selectors, create
; procedures that compute the perimeter and the area of a given rectangle. Now
; implement a different representation for rectangles. Can you design your 
; system with suitable abstraction barriers, so that the same perimeter and area
; procedures will work using either representation? 

; load points and segments stuff
(load "2/2.2.scm")

(define (length-segment seg)
  (define (square x) (* x x))
  (sqrt (+ (square (- (x-point (end-segment seg))
                      (x-point (start-segment seg))))
           (square (- (y-point (end-segment seg))
                      (y-point (start-segment seg)))))))

; First representation: (edges extremeties)
; ----b
; |   |
; a----
(define (make-rect a b) (cons a b))

(define (print-rect r) 
  (print-point (car r))
  (print-point (cdr r)))

(define (bl r) (car r))
(define (br r) (make-point (x-point (cdr r)) (y-point (car r))))
(define (tl r) (make-point (x-point (car r)) (y-point (cdr r))))
(define (tr r) (cdr r))

(define (width r)
  (length-segment (make-segment (bl r) (br r))))
(define (height r)
  (length-segment (make-segment (bl r) (tl r))))

(define (perimeter r)
  (* 2 (+ (width r) (height r))))
(define (area r)
  (* (width r) (height r)))

; (define r (make-rect (make-point 1 1) (make-point 6 4)))
; (print-rect r)
; (1,1)
; (6,4)
; (width r)
; 5
; (height r)
; 3
; (perimeter r)
; 16
; (area r)
; 15

; Not sure what is meant by a second representation, if it's a different
; constructor alone, if it's the same constructor but a different internal
; representation. I cannot think of any way without using the exact same 
; selector I built with a different internal representation (I can think of, for
; example, creating a width-2 procedure that also returns the width of a
; rectangle, but then perimeter and area would have to be rewritten to support
; the use of this new selector). I could rewrite another width procedure, but
; that would overwrite the existing width... They wouldn't work as generics.
;
; Well, let's assume it means a different internal representation, but the same
; constructor usage, where a is the bottom left point and b is the top right.
; But now, it internally represents it with the bottom-left point and a pair 
; with the width and the height.

(define (make-rect2 a b)
  (define w (length-segment (make-segment a
                                          (make-point (x-point b)
                                                      (y-point a)))))
  (define h (length-segment (make-segment a
                                          (make-point (x-point a)
                                                      (y-point b)))))
  (cons a (cons w h)))

(define (print-rect2 r)
  (print-point (car r))
  (display "Width: ")
  (display (car (cdr r)))
  (newline)
  (display "Height: ")
  (display (cdr (cdr r)))
  (newline))

(define (width2 r) (car (cdr r)))
(define (height2 r) (cdr (cdr r)))

(define width width2)
(define height height2)

(define r (make-rect2 (make-point 1 1) (make-point 6 4)))
(print-rect2 r)
; (1,1)
; Width: 5
; Height: 3
(width r)
; 5
(height r)
; 3
(perimeter r)
; 16
(area r)
; 15

