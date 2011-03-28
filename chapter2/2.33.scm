(load "../test_helper.scm")

(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(define (run-tests)
  (assert-equal '(1 4 9 16) (map square '(1 2 3 4)))
  (assert-equal '(1 2 3 4) (append '(1 2) '(3 4)))
  (assert-equal 5 (length '(1 2 3 4 5))))
  
