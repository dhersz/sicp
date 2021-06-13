; Louis Reasoner is having a terrible time doing Exercise 2.42. His queens
; procedure seems to work, but it runs extremely slowly. (Louis never does
; manage to wait long enough for it to solve even the 6×6 case.) When Louis asks
; Eva Lu Ator for help, she points out that he has interchanged the order of the
; nested mappings in the flatmap, writing it as
; 
; (flatmap
;  (lambda (new-row)
;    (map (lambda (rest-of-queens)
;           (adjoin-position 
;            new-row k rest-of-queens))
;         (queen-cols (- k 1))))
;  (enumerate-interval 1 board-size))
; 
; Explain why this interchange makes the program run slowly. Estimate how long
; it will take Louis’s program to solve the eight-queens puzzle, assuming that
; the program in Exercise 2.42 solves the puzzle in time T. 

; Because Louis is adding many recursion calls to the evaluation when he places
; queen-cols inside the inner-most map. Not really into the math of calculating
; how much slower that would be, because the safe? procedure messes up really
; hard with the number of calls, but it's definitely much slower :P
