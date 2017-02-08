%number 1
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


%number 2
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
