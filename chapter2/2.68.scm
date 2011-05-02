(load "../test_helper.scm")
(load "2.67.scm")

(define (encode message tree) 
  (if (null? message) 
      '() 
       (append (encode-symbol (car message) tree) 
               (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (let ((left (left-branch tree))
        (right (right-branch tree)))
    (cond ((leaf? tree) '())
          ((member symbol (symbols left)) (cons 0 (encode-symbol symbol left)))
          ((member symbol (symbols right)) (cons 1 (encode-symbol symbol right)))
          (else (error "no encoding for symbol")))))


(define run-tests
  (assert-equal '(a d a b b c a)
                (decode (encode '(a d a b b c a) sample-tree) sample-tree)))

