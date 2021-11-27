(define (make-vect x y)
  (cons x y))

(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

; addition
(define (add-vect vec1 vec2)
  (make-vect (+ (xcor-vect vec1) (xcor-vect vec2))
             (+ (ycor-vect vec1) (ycor-vect vec2))))

; subtraction
(define (sub-vect vec1 vec2)
  (make-vect (- (xcor-vect vec1) (xcor-vect vec2))
             (- (ycor-vect vec1) (ycor-vect vec2))))

; multiplying by scalar
(define (scale-vect x v)
  (make-vect (* x (xcor-vect v)) (* x (ycor-vect v))))
