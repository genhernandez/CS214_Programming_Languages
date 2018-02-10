#lang plai


;;;; CS 214 Grad Lab 1: Church Numerals

;;; Pairs
(define make-pair
  (lambda (a b)
    (lambda (sel)
      (sel a b))))

(define left
  (lambda (p)
    (p (lambda (a b) a))))

(define right
  (lambda (p)
    (p (lambda (a b) b))))

;;; Church Numerals
(define zero
  (lambda (f)
    (lambda (x)
      x)))

(define zero?
  (lambda (cn)
    ((cn (lambda (ignored)
           false))
     true)))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define succ
  (lambda (cn)
    (lambda (f)
      (lambda (x)
        (f ((cn f) x))))))

(define sum1
  (lambda (cn1)
    (lambda (cn2)
      (lambda (f)
        (lambda (x)
          ((cn1 f)
           ((cn2 f) x)))))))

(define sum2
  (lambda (cn1)
    (lambda (cn2)
      ((cn1 succ) cn2))))

(define prod
  (lambda (cn1)
    (lambda (cn2)
      ((cn1 (sum1 cn2)) zero))))

;; subtraction
(define f1
  (lambda (p)
    (make-pair (right p)
               (succ (right p)))))

(define pred
  (lambda (cn)
    (left ((cn f1)
           (make-pair zero zero)))))

(define sub
  (lambda (cn1)
    (lambda (cn2)
      ((cn2 pred) cn1))))



;; add-1
(define (add-1 n)
  (+ 1 n))

;;subtract-1
(define (subtract-1 n)
  (- 1 n))

;;cn->num
(define (cn->num f)
  ((f add-1) 0))

;;num->cn
(define (num->cn cn)
  (if (= 0 cn)
      zero
      (lambda (f)
        (lambda (x)
         (f (((num->cn (- cn 1)) f) x))))))


;;My Tests

;;Subtraction
(test (cn->num ((sub two) one)) 1)
(test (cn->num ((sub (num->cn 10)) one)) 9)
(test (cn->num ((sub (num->cn 20)) (num->cn 10))) 10)

;;cn->num

(test (cn->num (num->cn 1)) 1)
(test (cn->num (num->cn 0)) 0)
(test (cn->num (num->cn 100)) 100)
  

;;Testing

(test (zero? zero) true)
(test (zero? one) false)

;;; NOTE TO STUDENTS: Once you write "cn->num", uncomment the below tests by
;;; selecting the below text, then choosing Racket > Uncomment.

;;; Tests of succ
(test (cn->num (succ zero)) 1)
(test (cn->num (succ zero)) 1)
(test (cn->num (succ two)) 3)
;
;;; Tests of sum1
(test (cn->num ((sum1 zero) zero)) 0)
(test (cn->num ((sum1 one) one)) 2)
(test (cn->num ((sum1 one) two)) 3)
(test (cn->num ((sum1 two) two)) 4)

;;; Tests of sum2
(test (cn->num ((sum2 zero) zero)) 0)
(test (cn->num ((sum2 one) one)) 2)
(test (cn->num ((sum2 one) two)) 3)
(test (cn->num ((sum2 two) two)) 4)

;; Tests of prod
(test (cn->num ((prod zero) zero)) 0)
(test (cn->num ((prod zero) two)) 0)
(test (cn->num ((prod two) zero)) 0)
(test (cn->num ((prod two) one)) 2)
(test (cn->num ((prod two) two)) 4)

;; Tests of pred
(test (cn->num (pred two)) 1)
(test (cn->num (pred one)) 0)

  