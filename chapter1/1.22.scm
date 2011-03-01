; it took testing with 100,000,000 to get any timing results.
; Yes, the results show an order of growth of [theta] ([sqrt] (n))

;]=> (search-for-primes 100000000 100000100)

;100000007 *** 20
;100000037 *** 20
;100000039 *** 10

;]=> (search-for-primes 1000000000 1000000100)

;1000000007 *** 50
;1000000009 *** 50
;1000000021 *** 50

;]=> (search-for-primes 10000000000 10000000100)

;10000000019 *** 150
;10000000033 *** 140
;10000000061 *** 150

(load "1.21.scm")

(define (search-for-primes first last)
  (cond ((even? first) (search-for-primes (+ 1 first) last))
        ((<= first last) (begin  
                (timed-prime-test first)
                (search-for-primes (+ 2 first) last)))))

(define (timed-prime-test n) 
  (start-prime-test n (process-time-clock)))

(define (start-prime-test n start-time) 
  (if (prime? n) 
      (report-prime n (- (process-time-clock) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ") 
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)) )
