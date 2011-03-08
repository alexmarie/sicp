(load "../test_helper.scm")

(define (compose f g)
  (lambda (x) (f (g x))))

(define (run-tests)
  (assert-equal 49 ((compose square inc) 6)))
