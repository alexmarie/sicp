(load "../test_helper.scm")
(load "1.31.scm")
(load "1.22.scm")

(define (filtered-accumulate include? combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (include? a)
          (combiner (term a) (filtered-accumulate include? combiner null-value term (next a) next b))
          (filtered-accumulate include? combiner null-value term (next a) next b))))

(define (gcd a b) 
  (if (= b 0) 
      a 
      (gcd b (remainder a b))))

(define (sum-squared-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (product-relative-primes n)
  (define (relative-prime? a)
    (= 1 (gcd a n)))
  (filtered-accumulate relative-prime? * 1 noop 1 inc n))

(define (run-tests)
  (assert-equal 14 (sum-squared-primes 1 4))
  (assert-equal 189 (product-relative-primes 10)))
