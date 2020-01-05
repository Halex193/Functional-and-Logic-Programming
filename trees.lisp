;type 1: (A 2 B 0 C 2 D 0 E 0)

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

;type 2: (A (B) (C (D) (E)))

(DEFUN leftSubtree (Tr)
  (CDR Tr)
)

(DEFUN rightSubtree (Tr)
  (CDDR Tr)
)

(DEFUN getRoot (Tr)
  (CAR Tr)
)