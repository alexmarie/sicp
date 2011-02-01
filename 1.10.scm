(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))


1 ]=> (A 1 10)

;Value: 1024

1 ]=> (A 2 4)

;Value: 65536

1 ]=> (A 3 3)

;Value: 65536


(define (f n) (A 0 n))

(A 0 n)
2*n

(define (g n) (A 1 n))

(A 1 n)
(A 1 0) -> 0
(A 1 1) -> 2
(A 1 2) -> 4
(A 1 3) -> 8

2^y

(define (h n) (A 2 n))

(A 2 0) -> 0
(A 2 1) -> 2
(A 2 2) -> (A 1 (A 2 1)) -> (A 1 2) -> 4
(A 2 3) -> (A 1 (A 2 2)) -> (A 1 4) -> 16
(A 2 4) -> (A 1 (A 2 3)) -> (A 1 16) -> 65536

(2^ (2^ (2^2)))... where there are y 2's..mathematical notation??





