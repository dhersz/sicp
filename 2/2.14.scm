; Demonstrate that Lem is right. Investigate the behavior of the system on a
; variety of arithmetic expressions. Make some intervals A and B, and use them
; in computing the expressions A/A and A/B. You will get the most insight by
; using intervals whose width is a small percentage of the center value. Examine
; the results of the computation in center-percent form (see Exercise 2.12). 

; load interval stuff
(load "2/2.13.scm")

(define (par1 r1 r2)
  (div-interval 
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval 
     one
     (add-interval 
      (div-interval one r1) 
      (div-interval one r2)))))

(define i1 (make-center-percent 100 0.01))
(define i2 (make-center-percent 200 0.05))

; Lem is right:

(define p1 (par1 i1 i2))
(center p1)
; 66.9366592863739
(percent p1)
; 0.0964246534357237

(define p2 (par2 i1 i2))
(center p2)
; 66.6429310517474
(percent p2)
; 0.0233547029950916

; Experimenting:

(define a-over-a (div-interval i1 i1))
(center a-over-a)
; 1.000200020002
(percent a-over-a)
; 0.0199980001999801

(define a-over-b (div-interval i1 i2))
(center a-over-b)
; 0.501503759398496
(percent a-over-b)
; 0.0599700149925037

; So, again, t3 =~ t1 + t2. That's because A/A is the same as A * 1/A, and we 
; have seen in the previous exercise that the "rule" above holds for 
; multiplications as well. 
; 
; So the difference in Lem's calculations are due to the operations used to
; arrive at the results. In the second calculation, for example, the tolerance
; of the final resistance is gonna be the tolerance of the sum of R1 and R2 -
; which is proportional to the widths of each interval, which can be written as
; ((1/100) * 0.01 + (1/200) * 0.05)/ ((1/100)+(1/200)) = 0.0233333.
;
; In the first calculation, though, the final tolerance would be something like
; the tolerance of R1*R2 (0.01+0.05=0.06) over the tolerance of R1+R2=0.02333, 
; which is 0.06+0.02333=0.0833333. But I guess that these tolerances are not so
; small, so the the "rule" we have arrive at doesn't hold true. What matters, 
; however, is that error propagates more/faster with the first expression
; because of the operations it includes.

