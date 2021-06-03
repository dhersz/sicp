; Objects relevant to many exercises, either defined in SICP or by myself.

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (inc x) (+ x 1))

(define (average x y) (/ (+ x y) 2))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))
