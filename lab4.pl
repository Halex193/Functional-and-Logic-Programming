% flow (i, o)
powerset(S, L):-findall(R, (subset(S, R), mountain(R)), L).
subset([], []).
subset([_|T], R):-subset(T, R).
subset([H|T], [H|R]):-subset(T, R).

%flow (i)
mountain(L):-mountainAspect(L, none).

%flow(i, i)
mountainAspect([H1, H2|T], A):- A = none, H1 < H2, !, mountainAspect([H2|T], up).
mountainAspect([H1, H2|T], A):- A = up, H1 < H2, !, mountainAspect([H2|T], up).
mountainAspect([H1, H2|T], A):- A = up, H1 > H2, !, mountainAspect([H2|T], down).
mountainAspect([H1, H2|T], A):- A = down, H1 > H2, !, mountainAspect([H2|T], down).
mountainAspect([_], A):- A = down, !.