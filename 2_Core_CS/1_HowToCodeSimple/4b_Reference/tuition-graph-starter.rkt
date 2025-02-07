;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tuition-graph-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; tuition-graph-starter.rkt  (just the problem statements)

 #| 
PROBLEM:

Eva is trying to decide where to go to university. One important factor for her is 
"tuition costs". Eva is a visual thinker, and has taken Systematic Program Design, 
so she decides to "design a program that" will help her visualize the costs at 
different schools. She decides to start simply, knowing she can revise her design
later.

The information she has so far is the "names" of some schools as well as their 
international student "tuition costs". She would like to be able to represent that
information in bar charts like this one:


        #(struct:object:image% ... ...)
        
(A) Design "data definitions" to represent the information Eva has.
(B) Design a "function" that consumes information about schools and their
    tuition and produces a bar chart.
(C) Design a "function" that consumes information about schools and produces
    the school with the lowest international student tuition.
 |# 

(require 2htdp/image)
(require 2htdp/universe)

;; Visualize the costs at different schools

;; =================
;; Constants:
(define FONT-SIZE 24)
(define FONT-COLOR "black")
(define BAR-WIDTH 30)
(define BAR-COLOR "lightblue")



;; =================
;; Data definitions:

(define-struct school (name tuition))
;; School is (make-school String Number)
;; interp. name is school name; tuition is school tuition cost

(define S1 (make-school "UGM" 200))
(define S2 (make-school "UI"  250))
(define S3 (make-school "ITB" 300))
#;
(define (fn-for-school s)
  (... (school-name s)    ;String
       (school-tuition s) ;Number
       )
  )

;; Template rules used:
;; - compound: 2 fields



;; ListOfSchool is one of:
;; - empty
;; - (cons School ListOfSchool)
;; interp. a list of school

(define LOS0 empty)
(define LOS1 (cons (make-school "UGM" 20) empty))
(define LOS2 (cons S3 (cons S2 (cons S1 empty))))
#;
(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (fn-for-school (first los))
              (fn-for-los (rest los))
              )]
        )
  )

;; Template rules used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons School ListOfSchool)
;; - reference: (first los) is School
;; - self-reference: (rest los) is ListOfSchool



;; =================
;; Functions:

;#(struct:object:image% ... ...)

;; ListOfSchool -> Image
;; produce bar chart showing name and tuitions of consumed schools
(check-expect (chart empty) (square 0 "solid" "white"))

(check-expect (chart (cons (make-school "UGM" 200) empty))
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "UGM" FONT-SIZE FONT-COLOR))
                                           (rectangle BAR-WIDTH 200 "outline" "black")
                                           (rectangle BAR-WIDTH 200 "solid"   BAR-COLOR)
                                           )
                            (square 0 "solid" "white")
                            )
              )

(check-expect (chart (cons (make-school "UI" 250) (cons (make-school "UGM" 200) empty)))
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "UI" FONT-SIZE FONT-COLOR))
                                           (rectangle BAR-WIDTH 250 "outline" "black")
                                           (rectangle BAR-WIDTH 250 "solid"   BAR-COLOR)
                                           )
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "UGM" FONT-SIZE FONT-COLOR))
                                           (rectangle BAR-WIDTH 200 "outline" "black")
                                           (rectangle BAR-WIDTH 200 "solid"   BAR-COLOR)
                                           )
                            (square 0 "solid" "white")
                            )
              )

;(define (chart los) (square 0 "solid" "white")) ;stub

;Use Template from ListOfSchool

(define (chart los)
  (cond [(empty? los) (square 0 "solid" "white")]
        [else
         (beside/align "bottom"
                       (make-bar (first los))
                       (chart (rest los))
                       )]
        )
  )

;; School -> Image
;; produce the bar for a single school in bar chart
(check-expect (make-bar (make-school "UGM" 200))
              (overlay/align "center" "bottom"
                             (rotate 90 (text "UGM" FONT-SIZE FONT-COLOR))
                             (rectangle BAR-WIDTH 200 "outline" "black")
                             (rectangle BAR-WIDTH 200 "solid"   BAR-COLOR)
                             )
              )

;(define (make-bar s) (square 0 "solid" "white")) ;stub
#;
(define (make-bar s)
  (... s))

(define (make-bar s)
  (overlay/align "center" "bottom"
                 (rotate 90 (text (school-name s) FONT-SIZE FONT-COLOR))
                 (rectangle BAR-WIDTH (school-tuition s) "outline" "black")
                 (rectangle BAR-WIDTH (school-tuition s) "solid"   BAR-COLOR)
                 )
  )




