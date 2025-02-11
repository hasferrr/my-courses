;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 01-HtDfDesignQuiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

 #| PROBLEM:

Design a function that consumes two images and produces true if the first is larger than the second.

Once you have submitted your solution,
watch the assessment tutorial video in the next tab before completing your self-assessment.

Your design will be assessed using the following rubric:

1. Is the program "commit ready"?
   The file should be neat and tidy,
   no tests or code should be commented out other than stubs and templates and all scratch work should be removed.
   The identation should conform to course conventions and typing CMD-I (CTL-I on Windows) should not move anything.
   (But note that limitations of the peer tool mean that indentation can only be self-assessed.)

2. Is the design complete?
   All HtDF design elements should be present, and each element should be well-formed.

3. Does the design have high internal quality?
   The signature should be correct, the purpose should be clear and succinct,
   the examples should be sufficient to test and explain the function.
   The function name should be well chosen and should describe what the function does, not how it does it.
   The stub should match the signature. The template should be correct. The function body should be clear.
   When the program is run all the tests should pass, and those tests should cover the entire program.

4. Does the design satisfy the problem requirements?
   The function design should satisfy the problem statement.
   If there is any ambiguity in the problem statement the function design
   should identify and resolve that ambiguity.
 |# 

;; Image, Image -> Boolean
;; produce true if first image's both height and width are larger than second's, false otherwise
;; examples
(check-expect (is_larger_than (rectangle 10 20 "solid" "blue") (rectangle 10 20 "solid" "blue"))
              false)
(check-expect (is_larger_than (rectangle 10 21 "solid" "blue") (rectangle 10 20 "solid" "blue"))
              false)
(check-expect (is_larger_than (rectangle 11 20 "solid" "blue") (rectangle 10 20 "solid" "blue"))
              false)
(check-expect (is_larger_than (rectangle 11 21 "solid" "blue") (rectangle 10 20 "solid" "blue"))
              true)
(check-expect (is_larger_than (rectangle 9 19 "solid" "blue") (rectangle 10 20 "solid" "blue"))
              false)
(check-expect (is_larger_than (rectangle 10 19 "solid" "blue") (rectangle 10 20 "solid" "blue"))
              false)
(check-expect (is_larger_than (rectangle 9 20 "solid" "blue") (rectangle 10 20 "solid" "blue"))
              false)

;(define (is_larger_than img1 img2) false) ;stub

;(define (is_larger_than img1 img2) ;temp
;  (compare (...img1) (...img2))
;)


(define (is_larger_than img1 img2)
  (and
    (> (image-height img1) (image-height img2))
    (> (image-width img1) (image-width img2))
  )
)


