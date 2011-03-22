(load "../test_helper.scm")

(define (cc amount coin-values) 
  (cond ((= amount 0) 1) 
        ((or (< amount 0) (no-more? coin-values)) 0) 
        (else 
         (+ (cc amount 
                (except-first-denomination coin-values)) 
            (cc (- amount 
                   (first-denomination coin-values)) 
                coin-values))))) 

(define (no-more? values)
  (null? values))

(define (first-denomination coin-values)
  (car coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (run-tests)
  (assert-equal 7 (cc 6 '(1 2 3))))

;; Works with the list in any order
