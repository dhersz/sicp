; Right-split and up-split can be expressed as instances of a general splitting
; operation. Define a procedure split with the property that evaluating
; 
; (define right-split (split beside below))
; (define up-split (split below beside))
; 
; produces procedures right-split and up-split with the same behaviors as the
; ones already defined.

(define (split immediate-loc recursive-loc)
  (define (split-rec painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-rec painter (-n 1))))
          (immediate-loc painter
                         (recursive-loc smaller smaller))))))
