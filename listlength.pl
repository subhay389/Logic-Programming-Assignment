
listlength1([], 0 ).

listlength1([_|X] , L ):-
	listlength1(X,N),
	L is N+1.

find_len(List, Len):-
  listlength1(List, Len).

append([],X,X).
append([X|Y],Z,[X|W]):-
	append(Y,Z,W).
