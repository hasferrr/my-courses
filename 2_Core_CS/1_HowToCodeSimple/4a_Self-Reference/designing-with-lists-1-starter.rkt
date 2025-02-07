;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname designing-with-lists-1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; designing-with-lists-1-starter.rkt

 #| 
PROBLEM:

You've been asked to design a program having to do with all the owls
in the owlery.

(A) Design a "data definition" to represent the weights "of all the owls." 
    For this problem call it "ListOfNumber."
(B) Design a "function" that consumes the weights of owls and produces
    the total weight of all the owls.
(C) Design a "function" that consumes the weights of owls and produces
    the total number of owls.
     |# 

;; Data definitions:

;; ListOfNumber is one of:
;; - empty
;; - (cons Number ListOfNumber)
;; interp. the weights of an owl
(define LON1 empty)
(define LON2 (cons 50 empty))
(define LON3 (cons 60 (cons 40 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else (... (first lon)
                   (fn-for-lon (rest lon))
              )]
  )
)

;; Template rules used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Number ListOfNumber)
;;   - self-reference: (rest lon) is ListOfNumber




;; ===========================================================
;; Function:

;; ListOfNumber -> Number
;; produce produces the total weight of all the owls
(check-expect (total-weight empty) 0)
(check-expect (total-weight (cons 50 empty)) (+ 50 0))
(check-expect (total-weight (cons 60 (cons 20 empty))) (+ 60 20 0))

;(define (total-weight lon) 0) ;stub

;Use template from ListOfNumber

(define (total-weight lon)
  (cond [(empty? lon) 0]
        [else (+ (first lon) (total-weight (rest lon))
              )]
  )
)




;; ===========================================================
;; Function (2):

;; ListOfNumber -> Natural
;; produces the total number of owls that number in consumed list
(check-expect (number-of-owls empty) 0)
(check-expect (number-of-owls (cons 50 empty)) 1)
(check-expect (number-of-owls (cons 60 (cons 20 empty))) 2)

;(define (number-of-owls lon) 0) ;stub

;Use template from ListOfNumber

(define (number-of-owls lon)
  (cond [(empty? lon) 0]
        [else (+ 1 (number-of-owls (rest lon))
              )]
  )
)



;=============================================================
;code di bawah ini adalah solusi dari video persis

 #| ;; Data definitions:

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. each number in the list is an owl weight in ounces
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

  

;; Functions:

;; ListOfNumber -> Number
;; produce sum of weights of owls in lon
(check-expect (sum empty) 0)
(check-expect (sum (cons 20 empty)) 20)
(check-expect (sum (cons 32 (cons 20 empty))) (+ 32 20))

;(define (sum lon) 0) ;stub

(define (sum lon)
  (cond [(empty? lon) 0]
        [else
         (+ (first lon)          
            (sum (rest lon)))]))
 |# 



