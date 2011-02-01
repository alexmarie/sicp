;recursive:

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

;;iterative:

(define (f n)
  (if (< n 3)
      n
      (f-iter (- n 2) 2 1 0)))   

(define (f-iter count a b c)
  (if (= count 0)
      a
      (f-iter (- count 1) (+ a (* 2 b) (* 3 c)) a b)))
