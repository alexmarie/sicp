#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 1 1)))

(define (join-vects vect-list)
  (let ((rev-list (reverse vect-list)))
    (map (lambda (a b)(make-segment a b)) 
         vect-list 
         (cons (car rev-list) (reverse (cdr rev-list))))))

(define border-painter
  (segments->painter (join-vects (list (make-vect 0.1 0.1) (make-vect 0.1 0.9)  (make-vect 0.9 0.9) (make-vect 0.9 0.1)))))

(define x-painter
  (segments->painter (list (make-segment (make-vect 0.1 0.1) (make-vect 0.9 0.9))
                           (make-segment (make-vect 0.1 0.9) (make-vect 0.9 0.1)))))

(define diamond-painter
    (segments->painter (join-vects (list (make-vect 0.1 0.5) (make-vect 0.5 0.9)  (make-vect 0.9 0.5) (make-vect 0.5 0.1)))))
