(load "../test_helper.scm")
(load "../chapter1/1.16.scm")

(define (cons a b)
  (* (fast-expt 2 a) (fast-expt 3 b)))

(define (car n)
  (result n 0 even? 2))

(define (cdr n)
  (result n 0 div-by-three? 3))

(define (result n guess predicate root)
  (if (predicate n)
      (result (/ n root) (inc guess) predicate root)
      guess))

(define (div-by-three? n)
  (= (remainder n 3) 0))

(define (run-tests)
  (assert-equal 5 (car (cons 5 4)))
  (assert-equal 3 (cdr (cons 2 3))))
