sum-up-numbers-simple([], 0).

sum-up-numbers-simple(L, N):-
	[X|Y] = L,
	number(X),
	sum-up-numbers-simple(Y, N1),
	N is X + N1.

sum-up-numbers-simple(L, N):-
	[X|Y] = L,
	not(number(X)),
	sum-up-numbers-simple(Y, N1),
	N is X + N1.