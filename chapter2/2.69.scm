(load "huffman.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (if (= 1 (length leaf-set)) (car leaf-set)
      (successive-merge
       (adjoin-set
        (make-code-tree (car leaf-set) (cadr leaf-set))
        (cddr leaf-set)))))
