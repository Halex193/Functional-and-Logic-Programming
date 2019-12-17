;9. Write a function that removes all occurrences of an atom from any level of a list
; removeH (l: list, e: atom to be removed)
(DEFUN removeH (l e)
  (MAPCAN #'(LAMBDA (l) (COND
                          ((EQUAL l e) NIL)
                          ((ATOM l) (LIST l))
                          (T (LIST (removeH l e)))
                        )) l)
)

(write (removeH '(3 1 2 (3 4 5 (4 3 7 (1 2 3)))) 3))