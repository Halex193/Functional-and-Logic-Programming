% The list a1, ..., an is given and it consists of distinct integers. Write a predicate to determine all subsets
  % with aspect of "mountain" (a set has a "mountain" aspect if the elements increase to a certain point
  % and then decrease).
% mountainSets(L: input list, S: list of sets)
% flow (i, o)
mountainSets(L, S):-findall(R, (subset(L, R), mountain(R)), S).

% Computes the subsets of the list
% subset(L: input list, S: a subset of the list)
% flow(i, o)
subset([], []).
subset([H|T], [H|R]):-subset(T, R).
subset([_|T], R):-subset(T, R).

% Checks if a list has a mountain aspect
% mountain(L: input list)
% flow (i)
mountain(L):-mountainAspect(L, none).

% Checks if a list has a mountain aspect using an atom representing the state.For the first call, use 'none'
% mountainAspect(L: list, A: atom representing the state of the check)
% flow(i, i)
mountainAspect([H1, H2|T], A):- A = none, H1 < H2, !, mountainAspect([H2|T], up).
mountainAspect([H1, H2|T], A):- A = up, H1 < H2, !, mountainAspect([H2|T], up).
mountainAspect([H1, H2|T], A):- A = up, H1 > H2, !, mountainAspect([H2|T], down).
mountainAspect([H1, H2|T], A):- A = down, H1 > H2, !, mountainAspect([H2|T], down).
mountainAspect([_], A):- A = down, !.