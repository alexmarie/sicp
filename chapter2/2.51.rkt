#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 1 1)))

(define (transform-p painter origin corner1 corner2) 
  (lambda (frame) 
    (let ((m (frame-coord-map frame))) 
      (let ((new-origin (m origin))) 
        (painter 
         (make-frame new-origin 
                     (vector-sub (m corner1) new-origin) 
                     (vector-sub (m corner2) new-origin)))))))

(define (below1 painter1 painter2) 
  (let ((split-point (make-vect 0.0 0.5))) 
    (let ((paint-bottom 
           (transform-p painter1 
                              (make-vect 0.0 0.0) 
                              (make-vect 1.0 0.0)
                              split-point))
          (paint-top
           (transform-p painter2 
                              split-point 
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0)))) 
      (lambda (frame) 
        (paint-bottom frame) 
        (paint-top frame)))))

(define (below2 painter1 painter2)
  (rotate90 (beside (rotate270 painter1) (rotate270 painter2))))


