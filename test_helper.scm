(define (assert-equal expected actual)
  (assert = expected actual))

(define (assert-str-equal expected actual)
  (assert string=? expected actual))

(define (assert predicate expected actual)
  (if (not (predicate expected actual))
      (begin (newline)
             (display
              (string "Failure - not equal: expected: " expected
                              " actual: " actual)))
      (display "."))
  "test complete")

(define (inc a)
  (+ 1 a))

