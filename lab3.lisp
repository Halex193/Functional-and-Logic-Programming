;9. Write a function that removes all occurrences of an atom from any level of a list
; removeH (el: element, e: atom to be removed)
(DEFUN removeH (el e)
  (COND
    ((EQUAL el e) NIL)
    ((ATOM el) (LIST el))
    (T (LIST (MAPCAN #'(LAMBDA (el) (removeH el e)) el)))
  )
)

(write (removeH '(3 1 2 (3 4 5 (4 3 7 (1 2 3)))) 3))