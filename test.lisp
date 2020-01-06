;N: list of digits
(DEFUN successor1 (N)
  (COND
    ((NULL (CDR N))
      (LIST
        (floor (+ (CAR N) 1) 10)
        (mod (+ (CAR N) 1) 10)
      )
    )
    (T (PROG ((L (successor1 (CDR N))))
         (RETURN (CONS
                   (floor (+ (CAR N) (CAR L)) 10)
                   (CONS
                     (mod (+ (CAR N) (CAR L)) 10)
                     (CDR L)
                   )
                 )
         )
       ))
  )
)

;N: list of digits
(DEFUN successor (N)
  (PROG ((L (successor1 N)))
    (RETURN (COND
              ((EQUAL (CAR L) 0) (CDR L))
              (T L)
            ))
  )
)

(write (successor '(1 9 3 5 9 9)))
(write (successor '(1 2 3)))
(write (successor '(9 9)))
(write (successor '(2 1 9)))