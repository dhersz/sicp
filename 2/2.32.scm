; We can represent a set as a list of distinct elements, and we can represent 
; the set of all subsets of the set as a list of lists. For example, if the set
; is (1 2 3), then the set of all subsets is (() (3) (2) (2 3) (1) (1 3) (1 2)
; (1 2 3)). Complete the following definition of a procedure that generates the
; set of subsets of a set and give a clear explanation of why it works:
; 
; (define (subsets s)
;   (if (null? s)
;       (list nil)
;       (let ((rest (subsets (cdr s))))
;         (append rest (map ⟨??⟩ rest)))))

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; It works because the procedure recursively generates all possible combinations
; between the elements.
; In the case of the example, first it returns '().
; Then it will generate the subsets of (3), which is '() and the combinations
; between 3 and the previous element, '(), so it is (3).
; Then it will generate the subsets of (2 3), which is ('() (3)) plus the
; combinations of such element and (2), so (2) and (2 3).
; And the same happens again with (1 2 3).
