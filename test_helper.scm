(define (assert-equal expected actual)
  (assert (= expected actual)))

(define (assert-str-equal expected actual)
  (assert (string=? expected actual)))

(define (assert predicate)
  (if (not predicate)
      (begin (newline)
             (display
              (string "Failure - not equal: expected: " expected
                              " actual: " actual)))
      (display "."))
  "test complete")

(define (inc a)
  (+ 1 a))

