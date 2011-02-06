;;recursive solution

(define (fast-expt-recur b n) 
  (cond ((= n 0) 1) 
        ((even? n) (square (fast-expt-recur b (/ n 2)))) 
        (else (* b (fast-expt-recur b (- n 1)))))) 

;;iterative solution

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((= n 1) b)
        ((even? n) (even-expt-iter b n))
        (else (* b (even-expt-iter b (- n 1))))))

(define (even-expt-iter b n)
  (if (= n 1)
      b
      (even-expt-iter (square b) (/ n 2))))

;;tests

(load "../test_helper.scm")

(define (run-tests)
  (assert-same-results 2 0)
  (assert-same-results 2 1)
  (assert-same-results 2 2)
  (assert-same-results 2 3)
  (assert-same-results 3 4))

(define (assert-same-results b n)
  (newline)
  (display (string "Comparing results for b=" b " n=" n))
  (assert-equal (fast-expt-recur b n) (fast-expt b n)))
