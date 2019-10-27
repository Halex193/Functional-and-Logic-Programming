% containedIn(E: element, L: list)
% flow (i, i)
containedIn(E, [H|_]):-E == H.
containedIn(E, [H|L]):-E\=H, containedIn(E, L).

% listLength(L: list, LEN: length of the list)
% flow (i, o)
listLength([], 0).
listLength([_|L], LEN):-length(L, LEN2), LEN is LEN2 + 1.