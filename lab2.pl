% P1 : 11
% substitutes elements with given indexes in the list
% flow (i, i, i, o, o, o)
substitute(_, _, [], _, _):-false, !.
substitute(_, K2, _, _, _):-K2 < 0, !, false.
substitute(K1, K2, [H|L], _, _, [H|L]):-K1 == K2, K1 == 0, !.
substitute(K1, K2, [H|L], EL1, EL2, L2):-K1 > K2, !, substitute(K2, K1, [H|L], EL1, EL2, L2).
substitute(K1, K2, [H|L], H, EL2, [EL2|L2]):-K1 == 0, !,K22 is K2 - 1, substitute(-1, K22, L, H, EL2, L2).
substitute(_, K2, [H|L], EL1, H, [EL1|L]):-K2 == 0, !.
substitute(K1, K2, [H|L], EL1, EL2, [H|L2]):-K12 is K1 -1, K22 is K2 - 1, substitute(K12, K22, L, EL1, EL2, L2).

% creates a sublist
% flow (i, i, i, o)
sublist(_, _, [], []):-!.
sublist(_, N, [H|_], [H]):-N == 0, !.
sublist(M, N, [H|L], [H|L2]):-M =< 0, !, M2 is M - 1, N2 is N - 1, sublist(M2, N2, L, L2).
sublist(M, N, [_|L], L2):-M2 is M - 1, N2 is N - 1, sublist(M2, N2, L, L2).