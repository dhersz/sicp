; The sum procedure above generates a linear recursion. The procedure can be
; rewritten so that the sum is performed iteratively. Show how to do this by
; filling in the missing expressions in the following definition:
; 
; (define (sum term a next b)
;   (define (iter a result)
;     (if
;       <??>
;       <??>
;       (iter <??> <??>)))
;   (iter <??> <??>))

; load 'inc'
(load "common.scm")

(define (sum-iter term a next b)
  (define (iter a result)
    (if
      (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(sum-iter identity 1 inc 10) 
