;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname question_1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ----------
;; Data definitions:

(define-struct node (key val l r))
;; A BST (Binary Search Tree) is one of:
;;  - false
;;  - (make-node Integer String BST BST)
;; interp. false means no BST, or empty BST
;;         key is the node key
;;         val is the node val
;;         l and r are left and right subtrees
;; INVARIANT: for a given node:
;;     key is > all keys in its l(eft)  child
;;     key is < all keys in its r(ight) child
;;     the same key never appears twice in the tree
(define BST0 false)
(define BST1 (make-node 1 "abc" false false))
(define BST4 (make-node 4 "dcj" false (make-node 7 "ruf" false false)))
(define BST3 (make-node 3 "ilk" BST1 BST4))
(define BST42 
  (make-node 42 "ily"
             (make-node 27 "wit" (make-node 14 "olp" false false) false)
             (make-node 50 "dug" false false)))
(define BST10
  (make-node 10 "why" BST3 BST42))
#;
(define (fn-for-bst t)
  (cond [(false? t) (...)]
        [else
         (... (node-key t)    ;Integer
              (node-val t)    ;String
              (fn-for-bst (node-l t))
              (fn-for-bst (node-r t))
              )]
        ))
;; Template rules used:
;;  - one of: 2 cases
;;  - atomic-distinct: false
;;  - compound: (make-node Integer String BST BST)
;;  - self reference: (node-l t) has type BST
;;  - self reference: (node-r t) has type BST

;; ----------
;; Functions:
 #| "Image removed" |# 
 #| "Image removed" |# 

;; BST Natural -> ListOfString
;; produce path of search for key in BST
(check-expect (lookup-key BST0  99) (list "Fail"))
(check-expect (lookup-key BST10 10) (list "Succeed"))  ;succeed
(check-expect (lookup-key BST1   0) (list "L" "Fail")) ;L fail
(check-expect (lookup-key BST1   2) (list "R" "Fail")) ;R fail
(check-expect (lookup-key BST10  1) (list "L" "L" "Succeed"))  ;LL succeed
(check-expect (lookup-key BST10  4) (list "L" "R" "Succeed"))  ;LR succeed
(check-expect (lookup-key BST10 50) (list "R" "R" "Succeed"))  ;RR succeed
(check-expect (lookup-key BST10 14) (list "R" "L" "L" "Succeed"))  ;RLL succeed
;(define (lookup-key t k) "") ;stub
;Use template from BST, and additional atomic parameter k
(define (lookup-key t k)
  (cond [(false? t) (list "Fail")]
        [else
         (cond [(= k (node-key t))
                (list "Succeed")]
               [(> k (node-key t))
                (cons "R" (lookup-key (node-r t) k))]
               [(< k (node-key t))
                (cons "L" (lookup-key (node-l t) k))]
               )]
        ))



