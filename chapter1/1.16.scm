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
  (should-match-for 2 0)
  (should-match-for 2 1)
  (should-match-for 2 2)
  (should-match-for 2 3)
  (should-match-for 3 4))

(define (should-match-for b n)
  (newline)
  (display (string "Comparing results for b=" b " n=" n))
  (assert-equal (fast-expt-recur b n) (fast-expt b n)))
