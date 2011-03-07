(define (inc a)
  (+ 1 a))

(define (cube n)
  (* n n n))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (noop i) i)
  (product noop 1 inc n))

(load "../test_helper.scm")

(define (run-tests)
  (assert-equal 216 (product cube 1 inc 3))
  (assert-equal 24 (factorial 4)))
