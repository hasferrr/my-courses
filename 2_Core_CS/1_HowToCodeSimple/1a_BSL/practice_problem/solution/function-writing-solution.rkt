;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname function-writing-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; function-writing-solution.rkt

 #| 
PROBLEM:

Write a function that consumes two numbers and produces the larger of the two.  
 |# 

(define (larger x y)
  (if (> x y)
      x
      y))



