(load "../test_helper.scm")
(load "1.31.scm")

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (noop n) n)

(define (run-tests)
  (assert-equal 216 (product cube 1 inc 3))
  (assert-equal 10 (sum noop 1 inc 4)))
