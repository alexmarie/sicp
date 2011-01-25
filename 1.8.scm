(define (cube-root x)
  (cube-root-iter 1.0 x x))

(define (cube-root-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
      guess
      (cube-root-iter (improve guess x) guess x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess last-guess x)
  (< (abs (/ (- guess last-guess) x)) 0.001))
