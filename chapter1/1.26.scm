; In the "even" case, the time steps saved by dividing the exponent in half are cancelled out by performing 
; the expmod twice so you still end up doing n calculations

(define (expmod base exp m)
  56 Structure and Interpretation of Computer Programs, 2e 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (* (expmod base (/ exp 2) m) 
                       (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
         (remainder (* base (expmod base (- exp 1) m)) 
                    m)))) 
