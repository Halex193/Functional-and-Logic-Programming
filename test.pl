% minimum(L: list of integers, M: minimum element)
% Computes the minimum element of the list
% flow (i, o)
minimum([E], E):- !.
minimum([H|T], H):- minimum(T, M), H < M, !.
minimum([_|T], M):- minimum(T, M).

% substituteMinimum(L: list of integers, S: the substitution list, R: result list)
% Substitues all occurences of the minimum element of the list with another list
% flow (i, i, o)
substituteMinimum(L, S, R):- minimum(L, M), substituteElement(M, L, S, R).

% appendList(L: beggining list, S: ending list, R: result list)
% Concatenates the given lists into one
% flow (i, i, o)
appendList([H], S, [H|S]):- !.
appendList([H|T], S, [H|R]):- appendList(T, S, R).

% substituteElement(E: element, L: list of integers, S: substitution list, R: result list)
% Substitues all occurences of the element in the list with another list
% flow (i, i, i, o)
substituteElement(_, [], _, []):- !.
substituteElement(E, [H|T], S, R):- H == E, !, substituteElement(E, T, S, R1), appendList(S, R1, R).
substituteElement(E, [H|T], S, [H|R]):- substituteElement(E, T, S, R).