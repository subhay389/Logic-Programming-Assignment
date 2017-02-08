%base case when the list is empty
sum-up-numbers-simple([], 0).

%for numeric elements
sum-up-numbers-simple(L, N):-
	[X|Y] = L,
	number(X),
	sum-up-numbers-simple(Y, N1),
	N is X + N1.

%handles for non numeric number
sum-up-numbers-simple(L, N):-
	[X|Y] = L,
	not(number(X)),
	sum-up-numbers-simple(Y, N1),
	N is 0 + N1.
