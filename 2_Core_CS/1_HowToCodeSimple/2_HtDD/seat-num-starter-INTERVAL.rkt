;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname seat-num-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; seat-num-starter.rkt

 #| 
PROBLEM:

Imagine that you are designing a program to manage ticket sales for a
theatre. (Also imagine that the theatre is perfectly rectangular in shape!) 

Design a data definition to represent a seat number in a row, where each 
row has 32 seats. (Just the seat number, not the row number.)
  |# 

 #| A data definition consists of four or five elements:
1. A possible "structure definition" (not until compound data)
2. A "type comment" that defines a new type name and describes how to form data of that type.
3. An "interpretation" that describes the correspondence between information and data.
4. One or more "examples" of the data.
5. A "template" for a 1 argument function operating on data of this type. |# 

;; SeatNumber is Integer[1, 32]
;; interp. the number of seat in a row
(define SN1 1)  ;aisle
(define SN2 16) ;middle
(define SN3 32) ;aisle

#;
(define (fn-for-seat-number sn)
  (... sn))

; Template rules used:
;; - atomic non-distinct: Integer[1,32]


