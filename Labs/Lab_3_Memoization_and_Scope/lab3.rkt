#lang racket

(define (slow-add-one n)
  (begin
    (display "...")
    (sleep 1)
    (+ n 1)))

(define (slow-sub-one n)
  (begin
    (display "...")
    (sleep 1)
    (- n 1)))


(define memoizing-slow-add-one
  (let ((memoized-values (make-hash)))
    (lambda (n)
      (if (hash-has-key? memoized-values n)
          (hash-ref memoized-values n)
          (let ((value (slow-add-one n)))
            (begin
              (hash-set! memoized-values n value)
              value))))))



(define (make-memoizing f)
  (let ((memoized-values (make-hash)))
    (lambda (n)
      (if (hash-has-key? memoized-values n)
          (hash-ref memoized-values n)
          (let ((value (f n)))
            (begin
              (hash-set! memoized-values n value)
              value))))))



(define x 5)

(define display-x 
  (lambda () 
    (display x)))

(create-dynamic-scope ((x 1)) (display-x))



;(define mem-slow-add-one (make-memoizing slow-add-one))
;(time (mem-slow-add-one 0))
;(time (mem-slow-add-one 0))

;(time ((make-memoizing slow-add-one) 0))
;(time ((make-memoizing slow-add-one) 0))


;(define mem-slow-sub-one (make-memoizing slow-sub-one))
;(time (mem-slow-sub-one 3))
;(time (mem-slow-sub-one 3))

