% flow (i, i)
containedIn(_, []):-false.
containedIn(E, [H|_]):-E == H.
containedIn(E, [H|L]):-E\=H, containedIn(E, L).

% flow (i, o)
listLength([], 0).
listLength([_|L], LEN):-length(L, LEN2), LEN is LEN2 + 1.