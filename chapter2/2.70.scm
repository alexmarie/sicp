(load "huffman.scm")
(load "2.68.scm")
(load "2.69.scm")

(Define lyric-tree
  (generate-huffman-tree '((A 2)
                           (BOOM 1)
                           (GET 2)
                           (JOB 2)
                           (NA 16)
                           (SHA 3)
                           (YIP 9)
                           (WAH 1))
                         ))
(define song '(Get a job 
                   Sha na na na na na na na na 
                   Get a job 
                   Sha na na na na na na na na 
                   Wah yip yip yip yip yip yip yip yip yip 
                   Sha boom 
                   ))

> (encode song lyric-tree)

;Value: (1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1)

;84 bits

;Min number of fixed length bits is log(8) base 2 = 3. (108 total bits)
