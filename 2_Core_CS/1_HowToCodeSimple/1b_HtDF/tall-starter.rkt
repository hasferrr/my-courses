;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tall-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; tall-starter.rkt

 #| 
PROBLEM:

DESIGN a function that consumes an image and determines whether the 
image is tall.

Remember, when we say DESIGN, we mean follow the recipe.

Leave behind commented out versions of the stub and template.
 |# 

(require 2htdp/image)

;; Image -> Boolean
;; produce true if image is tall (where height is greater than width)
(check-expect (is_tall (rectangle 2 3 "solid" "blue")) true)
(check-expect (is_tall (rectangle 3 3 "solid" "blue")) false)
(check-expect (is_tall (rectangle 3 2 "solid" "blue")) false)
              
;(define (is_tall img) false) ;stub

;(define (is_tall img) ;temp
;  (... img))

(define (is_tall img)
  (> (image-height img) (image-width img))
)


