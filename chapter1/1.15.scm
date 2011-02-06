(define (cube x) (* x x x))

(define (p x)
  (write (string "(p " x ")")
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle) 
  (if (not (> (abs angle) 0.1)) 
      angle 
      (p (sine (/ angle 3.0)))))

a. P is called 5 times for (sine 12.5)

b. Because this is not tree recursion, there is no branching and time and space complexity are the same. Both grow at the rate of log (a)
