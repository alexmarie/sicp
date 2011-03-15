(load "../test_helper.scm")
(load "2.2.scm")

(define (make-rect1 width length)
  (cons width length))

(define (make-rect2 start-point end-point)
  (cons (abs (- (x-point start-point) (x-point end-point)))
        (abs (- (y-point start-point) (y-point end-point)))))

(define (width r)
  (car r))

(define (length r)
  (cdr r))

(define (perimeter r)
  (* 2 (+ (width r) (length r))))

(define (area r)
  (* (width r) (length r)))

(define (run-tests)
  (let ((rect1 (make-rect1 2 5))
        (rect2 (make-rect2 (make-point 1 2) (make-point 3 7))))
    (assert-equal 14 (perimeter rect1))
    (assert-equal 14 (perimeter rect2))
    (assert-equal 10 (area rect1))
    (assert-equal 10 (area rect2))))
