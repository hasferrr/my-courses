;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname demolish-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; demolish-starter.rkt

;; =================
;; Data definitions:

 #| 
PROBLEM A:

You are assigned to develop a system that will classify 
buildings in downtown Vancouver based on how old they are. 
According to city guidelines, there are three different classification levels:
new, old, and heritage.

Design a data definition to represent these classification levels. 
Call it BuildingStatus.
 |# 

 #| A data definition consists of four or five elements:
1. A possible "structure definition" (not until compound data)
2. A "type comment" that defines a new type name and describes how to form data of that type.
3. An "interpretation" that describes the correspondence between information and data.
4. One or more "examples" of the data.
5. A "template" for a 1 argument function operating on data of this type. |# 

;; BuildingStatus is one of:
;; - "new"
;; - "old"
;; - "heritage"
;; interp. classification levels of buildings in downtown Vancouver based on age

;; <examples are redundant for enumeration>

#;
(define (fn-for-building-status bs)
  (cond [(string=? bs "new") (...)]
        [(string=? bs "old") (...)]
        [else (...)]
        )
  )

;; Template rules used:
;; one of: 3 cases
;; - atomic distinct: "new"
;; - atomic distinct: "old"
;; - atomic distinct: "heritage"


;; =================
;; Functions:

 #| 
PROBLEM B:

The city wants to demolish all buildings classified as "old". 
You are hired to design a function called demolish? 
that determines whether a building should be torn down or not.
 |# 

;; BuildingStatus -> Boolean
;; produce true if building clasified as "old" means that wants to demolish, otherwise false
(check-expect (demolish? "old") true)
(check-expect (demolish? "new") false)
(check-expect (demolish? "heritage") false)

;(define (demolish? bd) false) ;stub

; <use template from BuildingStatus

(define (demolish? bs)
  (string=? bs "old"))


