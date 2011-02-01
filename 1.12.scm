(define (pascal row i) 
  (cond ((< i 1) 0)
        ((> i row) 0)
        ((< row 3) 1)
        (else (+ (pascal (- row 1) (- i 1))
             (pascal (- row 1) i)))))

; indexed by 1
