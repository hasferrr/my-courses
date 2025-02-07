;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname cantor-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; cantor-starter.rkt

; 
; PROBLEM:
; 
; A Cantor Set is another fractal with a nice simple geometry.
; The idea of a Cantor set is to have a bar (or rectangle) of
; a certain width w, then below that are two recursive calls each
; of 1/3 the width, separated by a whitespace of 1/3 the width.
; 
; w = (* CUTOFF 3)
; 
; So this means that the
;   width of the whitespace   wc  is  (/ w 3)
;   width of recursive calls  wr  is  (/ (- w wc) 2)
;   
; To make it look better a little extra whitespace is put between
; the bars.
; 
; 
; Here are a couple of examples (assuming a reasonable CUTOFF)
; 
; (cantor CUTOFF) produces:
; 
; .
; 
; (cantor (* CUTOFF 3)) produces:
; 
; .
; 
; And that keeps building up to something like the following. So
; as it goes it gets wider and taller of course.
; 
; .
; 
; 
; PROBLEM A:
; 
; Design a function that consumes a width and produces a cantor set of 
; the given width.
; 
; 
; PROBLEM B:
; 
; Add a second parameter to your function that controls the percentage 
; of the recursive call that is white each time. Calling your new function
; with a second argument of 1/3 would produce the same images as the old 
; function.
; 
; PROBLEM C:
; 
; Now you can make a fun world program that works this way:
;   The world state should simply be the most recent x coordinate of the mouse.
;   
;   The "to-draw" handler should just call your new cantor function with the
;   "width of your MTS as its first argument" and "the last x coordinate of
;   the mouse divided by that width as its second argument"
;   
; 
; 


;; ======================
;; Constant:

(define CUTOFF 4)
(define BAR-HEIGHT 20)
(define SPACING-HEIGHT (/ BAR-HEIGHT 2))

(define WIDTH  600)
(define HEIGHT 400)

(define MTS (empty-scene WIDTH HEIGHT))



;; ======================
;; Data definitions:

;; WS is Number
;; interp. x mouse coordinate
(define WS1 0)           ;left edge
(define WS2 (/ WIDTH 2)) ;middle
(define WS3 WIDTH)       ;right edge

#;
(define (fn-for-ws ws)
  (... ws))

;; Template rules used:
;;  - atomic non-distinct: Number




;; ======================
;; Functions:

;; WS -> WS
;; start the world with ...
;; 
(define (main ws)
  (big-bang ws                   ; WS
    (to-draw   render)           ; WS -> Image
    (on-mouse  handle-mouse)     ; WS Integer Integer MouseEvent -> WS
    ))

;_____________________________________________

;; WS -> Image
;; render cantor in MTS
(check-expect (render 100) (cantor WIDTH (/ 100 WIDTH)))
(check-expect (render 50) (cantor WIDTH (/ 50 WIDTH)))

;(define (render ws) MTS) ;stub

(define (render ws) (cantor WIDTH (/ ws WIDTH)))

;_____________________________________________
;_____________________________________________

;; Number -> Image
;; produces a cantor set IMGAGE of the given width
(check-expect (cantor CUTOFF (/ 1 3)) (rectangle CUTOFF 20 "solid" "blue"))
(check-expect (cantor (* CUTOFF 3) (/ 1 3))
              (above (rectangle (* CUTOFF 3) 20 "solid" "blue")
                     (rectangle CUTOFF 10 "solid" "transparent")
                     (beside (rectangle CUTOFF 20 "solid" "blue")
                             (rectangle CUTOFF 20 "solid" "transparent")
                             (rectangle CUTOFF 20 "solid" "blue"))))

;(define (cantor w) empty-image) ;stub

(define (cantor w scale)
  (local [(define (unexpected-negative-handler w scale)
            (cantor 0 scale))
          (define (cantor w scale)
            (cond [(negative? w) (unexpected-negative-handler w scale)]
                  [(<= w CUTOFF) (rectangle w BAR-HEIGHT "solid" "blue")]
                  [else
                   (local [(define wc  (* w scale))
                           (define wr  (/ (- w wc) 2))
                           (define sub (cantor wr scale))]
                     (above (rectangle w BAR-HEIGHT     "solid" "blue")
                            (rectangle w SPACING-HEIGHT "solid" "transparent")
                            (beside sub
                                    (rectangle wc BAR-HEIGHT "solid" "transparent")
                                    sub))
                     )]
                  ))]
    (cantor w scale)))

;_____________________________________________

;; WS Integer Integer MouseEvent -> WS
;; change WS based on mouse x coordinate

; x, y  adalah input dari lokasi x dan y mouse di MTS
; me,ke adalah input yang diberikan mouse/keyboard
; ws    adalah data type (bebas)

;; !!!

(define (handle-mouse ws x y me)
  (cond [(mouse=? me "move") x]
        [else ws]))

