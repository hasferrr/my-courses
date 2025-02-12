;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; SPD2-Design-Quiz-1.rkt


;; Constants
;; ---------
(define COOKIES "Image removed")

;; Data Definitions
;; ---------

;; Natural is one of:
;;  - 0
;;  - (add1 Natural)
;; interp. a natural number
(define N0 0)         ;0
(define N1 (add1 N0)) ;1
(define N2 (add1 N1)) ;2

#;
(define (fn-for-natural n)
  (cond [(zero? n) (...)]
        [else
         (... n   ; n is added because it's often useful                   
              (fn-for-natural (sub1 n))
              )]
        ))

;; Template rules used:
;;  - one-of: two cases
;;  - atomic distinct: 0
;;  - compound: 2 fields
;;  - self-reference: (sub1 n) is Natural




 #| PROBLEM 1:

Complete the "design of a function" called pyramid that takes a natural
number n and an image, and constructs an n-tall, n-wide pyramid of
copies of that image.

For instance, a 3-wide pyramid of cookies would look like this:

#(struct:object:image% ... ...) |# 

;; Function
;; ---------

;; Natural Image -> Image
;; produce an n-wide pyramid of the given image
(check-expect (pyramid 0 COOKIES) empty-image)
(check-expect (pyramid 1 COOKIES) COOKIES)
(check-expect (pyramid 2 COOKIES)
              (above COOKIES
                     (beside COOKIES COOKIES)))
(check-expect (pyramid 3 COOKIES)
              (above COOKIES
                     (beside COOKIES COOKIES)
                     (beside COOKIES COOKIES COOKIES)))

;(define (pyramid n i) empty-image) ; stub

;Use template from Natural

(define (pyramid n i)
  (cond [(zero? n) empty-image]
        [else
         (reverse-above (left-to-right n i)
                        (pyramid (sub1 n) i)
                        )]
        ))

;; ---------
;; ---------
;; Image Image -> Image
;; produce stacked images from bottom to top
(check-expect (reverse-above COOKIES (beside COOKIES COOKIES))
              (above (beside COOKIES COOKIES) COOKIES))

(define (reverse-above i1 i2) (above i2 i1))


;; ---------
;; ---------
;; Natural Image -> Image
;; produce stacked images in n numbers from left to right of given image
(check-expect (left-to-right 0 COOKIES) empty-image)
(check-expect (left-to-right 1 COOKIES) COOKIES)
(check-expect (left-to-right 2 COOKIES) (beside COOKIES COOKIES))
(check-expect (left-to-right 3 COOKIES) (beside COOKIES (beside COOKIES COOKIES)))

;(define (left-to-right n i) i) ;stub

;Use template from Natural

(define (left-to-right n i)
  (cond [(zero? n) empty-image]
        [else
         (beside i
                 (left-to-right (sub1 n) i)
                 )]
        ))


 #| Problem 2:
Consider a test tube filled with solid blobs and bubbles. Over time the
solids sink to the bottom of the test tube, and as a consequence the bubbles
percolate to the top.  Let's capture this idea in BSL.

Complete the "design of a function" that takes a list of blobs and sinks each
solid blob by one. It's okay to assume that a solid blob sinks past any
neighbor just below it.

To assist you, we supply the relevant data definitions. |# 

 #| Pertimbangkan tabung reaksi yang diisi dengan gumpalan padat dan gelembung.
Seiring waktu, padatan tenggelam ke dasar tabung reaksi, dan sebagai akibatnya
gelembung merembes ke atas. Mari kita tangkap ide ini di BSL.

Selesaikan "desain fungsi" yang mengambil daftar gumpalan dan menenggelamkan setiap
gumpalan padat satu per satu. Tidak apa-apa untuk berasumsi bahwa gumpalan padat tenggelam
melewati tetangga mana pun tepat di bawahnya.

Untuk membantu Anda, kami menyediakan definisi data yang relevan. |# 
;; ---------
;; Data Definition


;; Blob is one of:
;; - "solid"
;; - "bubble"
;; interp.  a gelatinous blob, either a solid or a bubble
;; Examples are redundant for enumerations
#;
(define (fn-for-blob b)
  (cond [(string=? b "solid") (...)]
        [(string=? b "bubble") (...)]
        ))
;; Template rules used:
;; - one-of: 2 cases
;; - atomic distinct: "solid"
;; - atomic distinct: "bubble"



;; ListOfBlob is one of:
;; - empty
;; - (cons Blob ListOfBlob)
;; interp. a sequence of blobs in a test tube, listed from top to bottom.
(define LOB0 empty) ; empty test tube
(define LOB2 (cons "solid" (cons "bubble" empty))) ; solid blob above a bubble
#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (fn-for-blob (first lob))
              (fn-for-lob (rest lob))
              )]
        ))
;; Template rules used
;; - one-of: 2 cases
;; - atomic distinct: empty
;; - compound: 2 fields
;; - reference: (first lob) is Blob
;; - self-reference: (rest lob) is ListOfBlob


;; ---------
;; Function

;; ListOfBlob -> ListOfBlob
;; produce a list of blobs that sinks the given solid blobs by one
;; hasilkan daftar gumpalan yang menenggelamkan gumpalan padat yang diberikan satu per satu
(check-expect (sink empty) empty)

(check-expect (sink (cons "bubble" (cons "solid"  (cons "bubble" empty))))
              (cons "bubble" (cons "bubble" (cons "solid" empty))))

(check-expect (sink (cons "solid"  (cons "solid"  (cons "bubble" empty))))
              (cons "bubble" (cons "solid"  (cons "solid" empty))))

(check-expect (sink (cons "solid"  (cons "bubble" (cons "bubble" empty))))
              (cons "bubble" (cons "solid"  (cons "bubble" empty))))

(check-expect (sink (cons "solid"  (cons "bubble" (cons "solid" empty))))
              (cons "bubble" (cons "solid" (cons "solid" empty))))

(check-expect (sink (cons "bubble" (cons "solid" (cons "solid" empty))))
              (cons "bubble" (cons "solid" (cons "solid" empty))))

(check-expect (sink (cons "solid"  (cons "solid" (cons "bubble" (cons "bubble" empty)))))
              (cons "bubble" (cons "solid" (cons "solid"  (cons "bubble" empty)))))

;(define (sink lob) empty) ;stub

;Use Template from ListOfBlob

(define (sink lob)
  (cond [(empty? lob) empty]
        [else
         (sort-blob (first lob) (sink (rest lob))
               )]
        ))

;; ---------
;; ---------
;; Blob ListOfBlob -> ListOfBlob
;; sort blob: solid then bubble
(check-expect (sort-blob "solid" empty) (cons "solid" empty))
(check-expect (sort-blob "bubble" empty) (cons "bubble" empty))
(check-expect (sort-blob "bubble" empty) (cons "bubble" empty))
(check-expect (sort-blob "solid" (cons "bubble" empty))
              (cons "bubble" (cons "solid" empty)))
(check-expect (sort-blob "solid" (cons "solid" empty))
              (cons "solid" (cons "solid" empty)))
(check-expect (sort-blob "bubble" (cons "solid" empty))
              (cons "bubble" (cons "solid" empty)))

;(define (sort-blob b lob) lob) ;stub

;Use template from ListOfBlob

(define (sort-blob b lob)
  (cond [(empty? lob) (cons b empty)]
        [else
         (if  (is-solid? b)
              (cons (first lob) (cons b (rest lob)))
              (cons b lob)
              )]
        ))

;;iam too lazy
;;is solid
(define (is-solid? b)
  (string=? b "solid"))



