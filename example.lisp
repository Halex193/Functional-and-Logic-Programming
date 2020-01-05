(DEFUN leftSubtree (Tr)
    (getLeftTree (CDDR Tr) 0 0)
)

(DEFUN getLeftTree (L n c)
    (COND
        ((> n c) NIL)
        (T (CONS (CAR L) (CONS (CADR L) (getLeftTree (CDDR L) (+ n 1) (+ c (CADR L))))))
    )
)

(DEFUN rightSubtree (Tr)
    (getRightTree (CDDR Tr) 0 0)
)

(DEFUN getRightTree (L n c)
    (COND
        ((> n c) L)
        (T (getRightTree (CDDR L) (+ n 1) (+ c (CADR L))))
    )
)

(DEFUN getRoot (Tr)
    (CAR Tr)
)

(DEFUN getNr (Tr)
    (CADR Tr)
)

(DEFUN findPath (Tr X)
    (COND
        ((NULL Tr) NIL)
        ((EQUAL (getRoot Tr) X) (LIST X))
        ((EQUAL (getNr Tr) 0) NIL)
        (T (PROG ((l (findPath (leftSubtree Tr) X)) (r (findPath (rightSubtree Tr) X)))
               (RETURN (COND
                   ((NOT (NULL l)) (CONS (getRoot Tr) l))
                   ((AND (EQUAL (getNr Tr) 2) (NOT (NULL r))) (CONS (getRoot Tr) r))
                   (T NIL)
               ))
           ))
    )
)

(write (findPath '(A 2 C 0 B 0) 'B))