% Given a linear numerical list write a predicate to remove all sequences of consecutive values
% remove(L: list, R: output list)
% flow (i, o)
remove([A,B,C|T], R):- A + 1 =:= B, B + 1 =\= C, !, remove([C|T], R).
remove([A,B,C|T], R):- A + 1 =:= B, B + 1 =:= C, !, remove([B,C|T], R).
remove([A,B|T], [A|R]):- A + 1 =\= B, !, remove([B|T], R).
remove([A,B], []):- A + 1 =:= B, !.
remove(L, L).

% For a heterogeneous list, formed from integer numbers and list of numbers; write a predicate to delete from
% every sublist all sequences of consecutive values.
% removeHeterogeneous(L: heterogeneous list, R: output list)
% flow (i, o)
removeHeterogeneous([H|T], [R1|R2]):-is_list(H), !, remove(H, R1), removeHeterogeneous(T, R2).
removeHeterogeneous([H|T], [H|R]):-number(H), !, removeHeterogeneous(T, R).
removeHeterogeneous(_, []).
