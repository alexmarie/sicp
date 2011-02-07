(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (even-mult-iter a b))
        (else (+ a (even-mult-iter a (- b 1))))))

(define (even-mult-iter a b)
  (if (= b 1)
      a
      (even-mult-iter (+ a a) (/ b 2))))

;;tests

(load "../test_helper.scm")

(define (run-tests)
  (assert-equal 0 (fast-mult 1 0))
  (assert-equal 0 (fast-mult 0 1))
  (assert-equal 5 (fast-mult 1 5))
  (assert-equal 10 (fast-mult 2 5))
  (assert-equal 8 (fast-mult 2 4)))
