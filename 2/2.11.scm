; In passing, Ben also cryptically comments: “By testing the signs of the
; endpoints of the intervals, it is possible to break mul-interval into nine
; cases, only one of which requires more than two multiplications.” Rewrite this
; procedure using Ben’s suggestion. 

; load interval stuff
(load "2/2.10.scm")

; Honestly, I couldn't figure out a prettier way than the one defined below. It
; seems excessive to test a hundred billion cases to "save" 2 multiplications 
; and a max min call, but whatever...

(define (both-positive? i)
  (and (> (upper-bound i) 0) (> (lower-bound i) 0)))

(define (both-negative? i)
  (and (< (upper-bound i) 0) (< (lower-bound i) 0)))

(define (new-mul-interval x y)
  (let ((xmax (upper-bound x))
        (xmin (lower-bound x))
        (ymax (upper-bound y))
        (ymin (lower-bound y)))
    (cond ((both-positive? x)
           (cond ((both-positive? y)
                  (make-interval (* xmin ymin) (* xmax ymax)))
                 ((both-negative? y) 
                  (make-interval (* xmax ymin) (* xmin ymax)))
                 (else
                   (make-interval (* xmax ymin) (* xmax ymax)))))
          ((both-negative? x)
           (cond ((both-positive? y) 
                  (make-interval (* xmin ymax) (* xmax ymin)))
                 ((both-negative? y)
                  (make-interval (* xmax ymax) (* xmin ymin)))
                 (else 
                   (make-interval (* xmin ymax) (* xmin ymin)))))
          (else
            (cond ((both-positive? y)
                   (make-interval (* xmin ymax) (* xmax ymax)))
                  ((both-negative? y)
                   (make-interval (* xmax ymin) (* xmin ymin)))
                  (else
                    (let ((p1 (* xmin ymin))
                          (p2 (* xmin ymax))
                          (p3 (* xmax ymin))
                          (p4 (* xmax ymax)))
                      (make-interval (min p1 p2 p3 p4)
                                     (max p1 p2 p3 p4)))))))))

; This is ugly as hell.
; Checking if it's correct though.

(define i1 (make-interval 3 4))
(define i2 (make-interval -3 4))
(define i3 (make-interval -4 -3))

(define (same-interval? x y)
  (and (= (lower-bound x) (lower-bound y)) (= (upper-bound x) (upper-bound y))))

; (same-interval? (mul-interval i1 i1) (new-mul-interval i1 i1))
; #t
; (same-interval? (mul-interval i1 i2) (new-mul-interval i1 i2))
; #t
; (same-interval? (mul-interval i1 i3) (new-mul-interval i1 i3))
; #t
; (same-interval? (mul-interval i2 i1) (new-mul-interval i2 i1))
; #t
; (same-interval? (mul-interval i2 i2) (new-mul-interval i2 i2))
; #t
; (same-interval? (mul-interval i2 i3) (new-mul-interval i2 i3))
; #t
; (same-interval? (mul-interval i3 i1) (new-mul-interval i3 i1))
; #t
; (same-interval? (mul-interval i3 i2) (new-mul-interval i3 i2))
; #t
; (same-interval? (mul-interval i3 i3) (new-mul-interval i3 i3))
; #t
