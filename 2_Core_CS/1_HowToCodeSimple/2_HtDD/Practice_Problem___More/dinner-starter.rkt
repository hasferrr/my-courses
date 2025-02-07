;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname dinner-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; dinner-starter.rkt

;; =================
;; Data definitions:

 #| 
PROBLEM A:

You are working on a system that will automate delivery for 
YesItCanFly! airlines catering service. 
There are three dinner options for each passenger, chicken, pasta 
or no dinner at all. 

Design a data definition to represent a dinner order. Call the type 
DinnerOrder.
 |# 

;; DinnerOrder is one of:
;; - "chicken"
;; - "pasta"
;; - "no dinner at all"
;; interp. dinner order

;<examples are redundant in enumeration>
#;
(define (fn-for-dinner-order do)
  (cond [(string=? do "chicken") (...)]
        [(string=? do "pasta") (...)]
        [else (...)])
  )

;; Template rules used:
;; one of: e cases
;; - atomic distinct: "chicken"
;; - atomic distinct: "pasta"
;; - atomic distinct: "no dinner at all"

;; =================
;; Functions:

 #| 
PROBLEM B:

Design the function dinner-order-to-msg that consumes a dinner order 
and produces a message for the flight attendants saying what the
passenger ordered. 

For example, calling dinner-order-to-msg for a chicken dinner would
produce "The passenger ordered chicken."
 |# 

;; DinnerOrder -> String
;; produce message for the flight attendants saying what the passenger ordered
(check-expect (dinner-order-to-msg "chicken") "The passenger ordered chicken.")
(check-expect (dinner-order-to-msg "pasta") "The passenger ordered pasta.")
(check-expect (dinner-order-to-msg "no dinner at all") "The passenger did not ordered.")

;(define (dinner-order-to-msg do) "") ;stub

;<use template from DinnerOrder>

(define (dinner-order-to-msg do)
  (cond [(string=? do "chicken") "The passenger ordered chicken."]
        [(string=? do "pasta") "The passenger ordered pasta."]
        [else "The passenger did not ordered."])
  )


