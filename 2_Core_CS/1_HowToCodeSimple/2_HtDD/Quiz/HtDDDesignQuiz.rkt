;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDDDesignQuiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; HtDD Design Quiz

;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
  (... a))

;; Template rules used:
;; - atomic non-distinct: Natural


 #| Problem 1:

Consider the above data definition for the age of a person.

Design a function called teenager? that determines whether a person
of a particular age is a teenager (i.e., between the ages of 13 and 19). |# 

;; Function

;; Age -> Boolean
;; produce true if a particular age is a teenager (between the ages of 13 and 19 (inclusive))
(check-expect (teenager? 5) false)
(check-expect (teenager? 13) true)
(check-expect (teenager? 16) true)
(check-expect (teenager? 19) true)
(check-expect (teenager? 40) false)

;(define (teenager? a) false) ;stub

;<use template from Age>

(define (teenager? a)
  (and (>= a 13) (<= a 19))
  )


 #| Problem 2:

Design a data definition called MonthAge to represent a person's age
in months. |# 

;; Data Definition

;; MonthAge is Natural
;; interp. person's age in months

(define MA1 12)
(define MA2 365)

#;
(define (fn-for-month-age ma)
  (... ma))

;; Template rules used:
;; - atomic non-distinct: Natural


 #| Problem 3:

Design a function called months-old that takes a person's age in years 
and yields that person's age in months.
 |# 

;; Function

;; Age -> MonthAge
;; produce person's age in months from person's age in years
(check-expect (months-old 5) 60)
(check-expect (months-old 12) 144)
(check-expect (months-old 40) (* 40 12))
(check-expect (months-old 0) (* 0 12))

;(define (months-old a) 0) ;stub

;<template from Age>

(define (months-old a)
  (* a 12))


 #| Problem 4:

Consider a video game where you need to represent the health of your
character. The only thing that matters about their health is:

  - if they are dead (which is shockingly poor health)
  - if they are alive then they can have 0 or more extra lives

Design a data definition called Health to represent the health of your
character.

Design a function called increase-health that allows you to increase the
lives of a character.  The function should only increase the lives
of the character if the character is not dead, otherwise the character
remains dead. |# 

;; Data Definition
;; ================

;; Health is one of:
;; - false
;; - Natural
;; interp.
;;   false   means the character are dead
;;   Natural means how many lives of character

(define H1 false)
(define H2 0)
(define H3 5)

#;
(define (fn-for-health h)
  (cond [(false? h) (...)]
        [else (... h)]
        )
  )

;; Template rules used:
;; - atomic distinct: false
;; - atomic non-distinct: Natural


;; Function
;; =========

;; Health -> Health
;; produce add 1 live of a character if not dead, otherwise the character remains dead
(check-expect (increase-health false) false)
(check-expect (increase-health 0) 1)
(check-expect (increase-health 1) 2)
(check-expect (increase-health 5) 6)

;(define (increase-health h) 0) ;stub

;<use template from Health>

(define (increase-health h)
  (cond [(false? h) false]
        [else (+ 1 h)]
        )
  )


