;9 a
(DEFUN mergeLists (a b)
  (COND
    ((NULL a) b)
    ((NULL b) a)
    ((< (CAR a) (CAR b)) (CONS (CAR a) (mergeLists (CDR a) b)))
    (t (CONS (CAR b) (mergeLists a (CDR b))))
  )
)

;(write (mergeLists '(1 2 3) '(2 3 4)))

;9 b
(DEFUN appendList (a b)
  (COND
    ((NULL a) b)
    (t (CONS (CAR a) (appendList (CDR a) b)))
  )
)

;(write (appendList '(1 2 3) '(4 5 6)))

(DEFUN replaceElement (e a b)
  (COND
    ((NULL a) nil)
    ((listp (CAR a)) (CONS (replaceElement e (CAR a) b) (replaceElement e (CDR a) b)))
    ((EQUAL (CAR a) e) (appendList b (replaceElement e (CDR a) b)))
    (t (CONS (CAR a) (replaceElement e (CDR a) b)))
  )
)

;(write (replaceElement 1 '((4 1) 2 1 3) '(12)))

;9 c weird
(DEFUN decimalSum (a b) (REVERSE (decimalSum2 (REVERSE a) (REVERSE b) 0)))

(DEFUN decimalSum2 (a b c)
  (COND
    ((AND (NULL a) (NULL b) (= c 0) ) nil)
    ((AND (NULL a) (NULL b)) (LIST c))
    (t
      (CONS
        (mod (+
               (COND ((NULL a) 0) (t (CAR a)))
               (COND ((NULL b) 0) (t (CAR b)))
               c
             )
          10
        )

        (decimalSum2
          (CDR a)
          (CDR b)
          (div (+
                 (COND ((NULL a) 0) (t (CAR a)))
                 (COND ((NULL b) 0) (t (CAR b)))
                 c) 10
          )
        )
      )
    )
  )
)

(DEFUN div (a b)
  (/ (- a (mod a b)) b)
)

;(write (decimalSum '(1 0 0) '(1)))

(DEFUN gcdim (a b)
  (COND
    ((= b 0) a)
    (t (gcdim b (mod a b)))
  )
)

;(write (gcdim 10 5))

(DEFUN gcdlist (l)
  (COND
    ((= (LENGTH l) 1) (CAR l))
    (t (gcdim (CAR l) (gcdlist (CDR l))))
  )
)

;(write (gcdlist '(230 400)))