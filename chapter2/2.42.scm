(define (queens board-size) 
  (define (queen-cols k) 
    (if (= k 0) 
        (list empty-board) 
        (filter 
         (lambda (positions) (safe? k positions)) 
         (flatmap 
          (lambda (rest-of-queens) 
            (map (lambda (new-row) 
                   (adjoin-position new-row k rest-of-queens)) 
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1)))))) 
  (queen-cols board-size))

(define (adjoin-position new-row column rest-of-queens)
  (cons (cons column new-row) rest-of-queens))

(define empty-board '())

(define (safe? column positions)
  (accumulate (lambda (position result)
                (and (pair-safe? (car positions) position) result))
              true (cdr positions)))

(define (pair-safe? queen1 queen2)
  (display queen1)
  (display queen2)
  (display "\n")
  (let ((i1 (car queen1))
        (i2 (car queen2))
        (j1 (cdr queen1))
        (j2 (cdr queen2)))
    (not (or (= i1 i2)
             (= j1 j2)
             (= (abs (- i2 i1)) (abs (- j2 j1)))))))

(define (enumerate-interval low high) 
  (if (> low high) 
      '() 
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

