sum-up-numbers-general([], 0).

sum-up-numbers-general(L, N):-
	[X|Y] = L,
	number(X),
	sum-up-numbers-general(Y, N1),
	N is N1 + X.


sum-up-numbers-general(L, N):-
	[X|Y] = L,
	is_list(X),
	[A|B] = X,
	sum-up-numbers-general(B, N1),
	N is N1 + A.

%sum-up-numbers-general(L, N):-
	