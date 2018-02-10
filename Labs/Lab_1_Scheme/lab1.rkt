#lang plai
(define (add-one n)
  (+ 1 n))

(define (repeated f count)
  (cond [(= count 0)(lambda (x)
                      x)]
        [else (lambda (x)
                (f ((repeated f (- count 1)) x)))]))

(define add-one-five-times
  (repeated add-one 5))

(define add-one-zero-times
  (repeated add-one 0))

(define add-one-one-time
  (repeated add-one 1))

(define add-one-two-times
  (repeated add-one 2))

  
(test (add-one-five-times 0) 5)
(test (add-one-five-times 10) 15)
(test (add-one-zero-times 10) 10)
(test (add-one-one-time 10) 11)
(test (add-one-two-times 0) 2)


(define (my-filter pred lst)
  (if (empty? lst)
      empty
      (if (pred (first lst))
                (cons (first lst) (my-filter pred (rest lst)))
                      (my-filter pred (rest lst)))))

(test (my-filter odd? '(1 2 4 5)) '(1 5))
(test (my-filter odd? '()) '())
(test (my-filter even? '(1 2 4 5)) '(2 4))
(test (my-filter even? '(1 2)) '(2))
(test (my-filter odd? '(4)) '())

(define (add1-filter-odd n)
  (map add-one (filter odd? n)))

(test (add1-filter-odd '(1 2 3 4)) '(2 4))
(test (add1-filter-odd '()) '())
(test (add1-filter-odd '(2 4 6)) '())
(test (add1-filter-odd '(11 17 19 101 99 8)) '(12 18 20 102 100))
