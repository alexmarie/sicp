(load "../test_helper.scm")

(define (my-reverse l)
  (partial-reverse l '()))

(define (partial-reverse remaining so-far)
  (if (null? remaining) so-far
      (partial-reverse (cdr remaining) (cons (car remaining) so-far))))

(define (run-tests)
  (assert-equal (list 4 3 2 1) (my-reverse (list 1 2 3 4))))
