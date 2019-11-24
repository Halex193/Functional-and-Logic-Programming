%9.
%a. For a list of integer number, write a predicate to add in list after 1-st, 3-rd, 7-th, 15-th element a given value
%e.
%b. For a heterogeneous list, formed from integer numbers and list of numbers; add in every sublist after 1-st,
%3-rd, 7-th, 15-th element the value found before the sublist in the heterogenous list. The list has the particularity
%that starts with a number and there aren’t two consecutive elements lists.
%Eg.: [1, [2, 3], 7, [4, 1, 4], 3, 6, [7, 5, 1, 3, 9, 8, 2, 7], 5] =>
%[1, [2, 1, 3], 7, [4, 7, 1, 4, 7], 3, 6, [7, 6, 5, 1, 6, 3, 9, 8, 2, 6, 7], 5].

% addValue(E: integer, L: list, R: result list)
% flow (i, i, o)
addValue(E, L, R):-addValueP(E, L, 1, R).

% addValueP(E: integer, L: list, P: integer, R: result list)
% flow (i, i, i, o)
addValueP(_, [], _, []):-!.
addValueP(E, [H|T], P, [H, E|R]):- P is 1 , !, P1 is P + 1, addValueP(E, T, P1, R).
addValueP(E, [H|T], P, [H, E|R]):- P is 3 , !, P1 is P + 1, addValueP(E, T, P1, R).
addValueP(E, [H|T], P, [H, E|R]):- P is 7 , !, P1 is P + 1, addValueP(E, T, P1, R).
addValueP(E, [H|T], P, [H, E|R]):- P is 15 , !, P1 is P + 1, addValueP(E, T, P1, R).
addValueP(E, [H|T], P, [H|R]):- P1 is P + 1, addValueP(E, T, P1, R).

% addValueH(L: list, R: result list)
% flow (i, o)
addValueH([], []):- !.
addValueH([H1, H2|T], [H1, R1|R]):- number(H1), is_list(H2), !, addValue(H1, H2, R1), addValueH(T, R).
addValueH([H|T], [H|R]):- addValueH(T, R).
