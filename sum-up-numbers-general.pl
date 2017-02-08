%base case
sum-up-numbers-general([], 0).

%if it is number
sum-up-numbers-general(L, N):-
	[X|Y] = L,
	number(X),
	sum-up-numbers-general(Y, N1),
	N is N1 + X.

%if it is a list 
sum-up-numbers-general(L, N):-
	[X|_] = L,
	is_list(X),
	[A|B] = X,
	sum-up-numbers-general(B, N1),
	N is N1 + A.

%if it is not a number
sum-up-numbers-general(L, N):-
	[X|Y] = L,
	not(number(X)),
	sum-up-numbers-general(Y, N1),
	N is 0 + N1.
