;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname double-all-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; double-solution.rkt

;; =================
;; Data definitions:

 #| 
Remember the data definition for a list of numbers we designed in Lecture 5f:
(if this data definition does not look familiar, please review the lecture)
 |# 

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber

;; =================
;; Functions:

 #| 
PROBLEM:

Design a function that consumes a list of numbers and doubles every number 
in the list. Call it double-all.
 |# 

;; ListOfNumber -> ListOfNumber
;; double every number in the given list
(check-expect (double-all empty) empty)
(check-expect (double-all LON2) (cons  120 (cons 84 empty)))
(check-expect (double-all (cons 10 (cons 20 (cons 50 empty))))
              (cons 20 (cons 40 (cons 100 empty))))

;(define (double-all lon) empty) ;stub
;<template from ListOfNumber>
(define (double-all lon)
  (cond [(empty? lon) empty]
        [else
         (cons (* 2 (first lon))
               (double-all (rest lon)))]))



