;;Using a tolerance of 0.001 when calculating square roots of small numbers will lead to a huge margin of error in terms of the size of the original number (over 100% if the number is smaller than than the tolerance). For very large numbers, the lack of precision will cause the estimation to bounce back and forth over and under the actual square root value and may never return.

;;Alternative strategy:

(define (sqrt x)
  (sqrt-iter 1.0 x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess last-guess x)
  (< (abs (/ (- guess last-guess) x)) 0.001))

(define (sqrt-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
      guess
      (sqrt-iter (improve guess x) guess x)))

