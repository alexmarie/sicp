Normal Order:

a = 206
b = 40
eval b = 40
remainder calls: 0

a = 40
b = (r 206 40)
eval b = 6
remainder calls: 1

a = (r 206 40)
b = (r 40 (r 206 40))
eval b = 4
remainder calls: 2

a = (r 40 (r 206 40))
b = (r (r 206 40) (r 40 (r 206 40)))
eval b = 2
remainder calls: 4

a = (r (r 206 40) (r 40 (r 206 40)))
b = (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))
eval b = 0
eval + return a = 2
remainder calls = 11

Total remainder calls = 18

Applicative Order:

a = 206
b = 40
eval b = 40
remainder calls: 0

a = 40
b = (r 206 40) = 6
remainder calls: 1

a = 6
b = (r 40 6) = 4
remainder calls: 1

a = 4
b = (r 6 4) = 2
remainder calls: 1

a = 2
b = (r 4 2) = 0
remainder calls: 1
return 2

Total remainder calls:
- normal order: 18
- applicative order: 4

