
listlength([], 0 ).

listlength([_|X] , L ):-
	listlength(X,N),
	L is N+1.
