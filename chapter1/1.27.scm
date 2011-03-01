;This Fermat test does show the Carmichael numbers to be prime.

(define (fermat-test n)
  (define (try-it a)
    (cond ((= a 0) true)
          ((= (expmod a n n) a) (try-it (- a 1)))
          (else
           (begin (display (string "failed on " a))
                  false))))
  (try-it (- n 1)))

(define (expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (square (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
         (remainder (* base (expmod base (- exp 1) m)) 
                    m))))

