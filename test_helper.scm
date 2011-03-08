(define (assert-equal expected actual)
  (if (not (= expected actual))
      (begin (newline)
             (display (string "Failure - not equal: expected: " expected
                              " actual: " actual)))
      (display "."))
  "test complete")

(define (inc a)
  (+ 1 a))

