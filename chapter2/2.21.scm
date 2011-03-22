(load "../test_helper.scm")

(define (square-list-1 items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list-1 (cdr items))))) 

(define (square-list-2 items) 
  (map square items))

(define (run-tests)
  (assert-equal '(1 4 9 16) (square-list-1 '(1 2 3 4)))
  (assert-equal '(1 4 9 16) (square-list-2 '(1 2 3 4))))
