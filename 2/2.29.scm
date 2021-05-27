; A binary mobile consists of two branches, a left branch and a right branch. 
; Each branch is a rod of a certain length, from which hangs either a weight or
; another binary mobile. We can represent a binary mobile using compound data by
; constructing it from two branches (for example, using list):
; 
; (define (make-mobile left right)
;   (list left right))
; 
; A branch is constructed from a length (which must be a number) together with a
; structure, which may be either a number (representing a simple weight) or
; another mobile:
; 
; (define (make-branch length structure)
;   (list length structure))
; 
; 1. Write the corresponding selectors left-branch and right-branch, which 
; return the branches of a mobile, and branch-length and branch-structure, which
; return the components of a branch.
; 2. Using your selectors, define a procedure total-weight that returns the
; total weight of a mobile.
; 3. A mobile is said to be balanced if the torque applied by its top-left 
; branch is equal to that applied by its top-right branch (that is, if the
; length of the left rod multiplied by the weight hanging from that rod is equal
; to the corresponding product for the right side) and if each of the submobiles
; hanging off its branches is balanced. Design a predicate that tests whether a
; binary mobile is balanced.
; 4. Suppose we change the representation of mobiles so that the constructors
; are
; 
; (define (make-mobile left right)
;   (cons left right))
; 
; (define (make-branch length structure)
;   (cons length structure))
; 
; How much do you need to change your programs to convert to the new
; representation? 

(define (make-mobile left right)
  (list left right))
 
(define (make-branch length structure)
  (list length structure))

(define x (make-mobile 
            (make-branch 3 2)
            (make-branch 4 (make-mobile
                             (make-branch 3 1)
                             (make-branch 1 2)))))

; 1.

(define (left-branch mob) (car mob))
(define (right-branch mob) (cadr mob))
(define (branch-length brc) (car brc))
(define (branch-structure brc) (cadr brc))

; 2.

(define (total-weight mob)
  (if (not (pair? mob))
      mob
      (+ (total-weight (branch-structure (left-branch mob)))
         (total-weight (branch-structure (right-branch mob))))))

; 3.

(define b (make-mobile 
            (make-branch 6 4)
            (make-branch 3 (make-mobile
                             (make-branch 5 3)
                             (make-branch 3 5)))))

(define (same-torque? mob)
  (= (* (total-weight (branch-structure (left-branch mob)))
        (branch-length (left-branch mob)))
     (* (total-weight (branch-structure (right-branch mob)))
        (branch-length (right-branch mob)))))

(define (balanced? mob)
  (if (not (pair? mob))
      #t
      (and (same-torque? mob)
           (balanced? (branch-structure (left-branch mob)))
           (balanced? (branch-structure (right-branch mob))))))

; 4. You only need to change the selectors.

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mob) (car mob))
(define (right-branch mob) (cdr mob))
(define (branch-length brc) (car brc))
(define (branch-structure brc) (cdr brc))

(define x (make-mobile 
            (make-branch 3 2)
            (make-branch 4 (make-mobile
                             (make-branch 3 1)
                             (make-branch 1 2)))))

; (balanced? x)
; #f
; (total-weight x)
; 5
