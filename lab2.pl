% P1 : 11
% substitutes an element with another element
% substitute(K1: position 1, K2: position 2, L: list, L2: the resulting list)
% flow (i, i, i, o)
substitute(_, _, [], []):-!.
substitute(K1, K2, [H|L], [H|L2]):-K1 \= 0, !, K11 is K1 - 1, K21 is K2 -1, substitute(K11, K21, L, L2).
substitute(K1, K2, [H|L], [F|L2]):- find(K2, [H|L], F), K11 is K1 - 1, K21 is K2 -1, substitute(K11, K21, L, L2).

% finds an element in a list by its index
% find(K1: index, L: list, F: the found element)
% flow (i, i, o)
find(_, [], _):-!, fail.
find(K1, [H|_], H):-K1 == 0, !.
find(K1, [_|L], F):-K11 is K1 -1, find(K11, L, F).

% creates a sublist from a list between the specified indexes
% sublist(M: the first index, N: the last index, L: the list, L2: the sublist)
% flow (i, i, i, o)
sublist(_, _, [], _):-!, fail.
sublist(M, N, _, _):-M > N, !, fail.
sublist(_, N, [H|_], [H]):-N == 0, !.
sublist(M, N, [H|L], [H|L2]):-M =< 0, !, M2 is M - 1, N2 is N - 1, sublist(M2, N2, L, L2).
sublist(M, N, [_|L], L2):-M2 is M - 1, N2 is N - 1, sublist(M2, N2, L, L2).