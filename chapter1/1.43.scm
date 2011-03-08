(load "../test_helper.scm")
(load "1.42.scm")

(define (repeated f times)
  (define (compose-recur f times)
      (if (= times 1)
          f
          (compose f (compose-recur f (- times 1)))))
  (lambda (initial)    
    ((compose-recur f times) initial)))

(define (run-tests)
  (assert-equal 625 ((repeated square 2) 5)))
