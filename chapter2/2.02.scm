(load "../test_helper.scm")

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (str-point p)
  (string "(" (x-point p) "," (y-point p) ")")) 

(define (make-segment x1 y1 x2 y2)
  (cons (make-point x1 y1) (make-point x2 y2)))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (str-seg s)
  (string (str-point (start-segment s)) " "
          (str-point (end-segment s))))

(define (run-tests)
  (assert-str-equal "(1,2)" (str-point (make-point 1 2)))
  (assert-str-equal "(1,2) (3,4)" (str-seg (make-segment 1 2 3 4))))
