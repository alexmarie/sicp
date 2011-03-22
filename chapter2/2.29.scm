(load "../test_helper.scm")

(define (make-mobile left right) 
  (list left right))

(define (make-branch length structure) 
  (list length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (car (cdr m)))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (car (cdr b)))

(define (total-weight m)
  (if (null? (cdr m)) (car m)
      (+ (branch-weight (left-branch m))
         (branch-weight (right-branch m)))))

(define (sub-branches? b)
  (list? (branch-structure b)))

(define (branch-weight b)
  (if (sub-branches? b)
      (total-weight (branch-structure b))
      (branch-structure b)))

(define (balanced? m)
  (and (= (torque (left-branch m)) (torque (right-branch m)))
       (branch-balanced? (left-branch m))
       (branch-balanced? (right-branch m))))

(define (torque b)
  (* (branch-length b)
     (branch-weight b)))

(define (branch-balanced? b)
  (if (sub-branches? b) (balanced? (branch-structure b)) #t))

(define (run-tests)
  (assert-equal 5 (branch-weight (make-branch 4 5)))
  (assert-equal 20 (torque (make-branch 4 5)))
  (assert (not (balanced? (make-mobile (make-branch 1 2) (make-branch 3 4)))))
  (assert (balanced? (make-mobile (make-branch 2 4) (make-branch 1 8))))
  (assert (balanced? (make-mobile
                      (make-branch 1 (make-mobile (make-branch 2 4) (make-branch 1 8)))
                      (make-branch 2 (make-mobile (make-branch 2 2) (make-branch 1 4)))))))
