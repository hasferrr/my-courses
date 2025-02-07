;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname concentric-circles-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; concentric-circles-starter.rkt

 #|  PROBLEM:
 
 Design a function that consumes a natural number n and a color c, and produces n 
 concentric circles of the given color.
 
 So (concentric-circles 5 "black") should produce #(struct:object:image% ... ...)
  |# 
(define COLOR "black")

;; Natural COLOR -> Image
;; produces n concentric circles of the given color
(check-expect (concentric-circles 0 "black") (circle 0 "outline" "black"))
(check-expect (concentric-circles 1 "black") (overlay (circle 10 "outline" "black")
                                                      (circle  0 "outline" "black")))
(check-expect (concentric-circles 5 "black") (overlay (circle 50 "outline" "black")
                                                      (circle 40 "outline" "black")
                                                      (circle 30 "outline" "black")
                                                      (circle 20 "outline" "black")
                                                      (circle 10 "outline" "black")
                                                      (circle  0 "outline" "black")))

;(define (concentric-circles n c) (circle 5 "outline" "black")) ;stub

(define (concentric-circles n c)
  (cond [(zero? n) (circle 0 "outline" "black")]
        [else (overlay (circle (* n 10) "outline" "black")
                       (concentric-circles (sub1 n) COLOR)
                       )]
        )
  )








