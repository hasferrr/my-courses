;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname abstract-sum-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; abstract-sum-starter.rkt

; 
; PROBLEM A:
; 
; Design an abstract function (including signature, purpose, and tests) to 
; simplify the two sum-of functions. 
; 


;; (X -> Number) (listof X) -> Number
;; produce sum of the function operates for every element in list of X in lox
(check-expect (abstract-sum sqr empty) 0)
(check-expect (abstract-sum sqr (list 2 4)) (+ 4 16))
(check-expect (abstract-sum string-length empty) 0)
(check-expect (abstract-sum string-length (list "a" "bc")) 3)

(define (abstract-sum func lox)
  (cond [(empty? lox) 0]
        [else
         (+ (func (first lox))
            (abstract-sum func (rest lox)))]))


; 
; PROBLEM B:
; 
; Now re-define the original functions to use abstract-sum. 
; 
; Remember, the signature and tests should not change from the original 
; functions.
; 


;; (listof Number) -> Number
;; produce the sum of the squares of the numbers in lon
(check-expect (sum-of-squares empty) 0)
(check-expect (sum-of-squares (list 2 4)) (+ 4 16))
#;
(define (sum-of-squares lon)
  (cond [(empty? lon) 0]
        [else
         (+ (sqr (first lon))
            (sum-of-squares (rest lon)))]))

(define (sum-of-squares lon)
  (abstract-sum sqr lon))



;; (listof String) -> Number
;; produce the sum of the lengths of the strings in los
(check-expect (sum-of-lengths empty) 0)
(check-expect (sum-of-lengths (list "a" "bc")) 3)
#;
(define (sum-of-lengths los)
  (cond [(empty? los) 0]
        [else
         (+ (string-length (first los))
            (sum-of-lengths (rest los)))]))

(define (sum-of-lengths los)
  (abstract-sum string-length los))
