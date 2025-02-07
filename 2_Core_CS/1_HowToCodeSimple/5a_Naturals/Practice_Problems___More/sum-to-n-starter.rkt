;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname sum-to-n-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sum-to-n-starter.rkt

 #|   PROBLEM:
  
  Design a function that produces the sum of all the naturals from 0 to a given n. 
   |# 

;; Natural -> Natural
;; produces the sum of all the naturals from 0 to a given n
(check-expect (sum_natural 0) 0)
(check-expect (sum_natural 1) (+ 1 0))
(check-expect (sum_natural 2) (+ 2 1 0))
(check-expect (sum_natural 3) (+ 3 2 1 0))

;(define (sum_natural s) 0) ;stub

(define (sum_natural s)
  (cond [(zero? s) 0]
        [else
         (+ s
              (sum_natural (- s 1)))
         ]
        )
  )

