%common-unique-elements(L1,L2,N).


% removing nested loop
remove_nested([X|Y],[X|_]):-
  listlen(Y, Length),
  Length < 1.

remove_nested(List, Single_list) :-
  [X|Y] = List,
  not(is_list(X)),
  remove_nested(Y, S1),
  append(X,S1,Single_list).

remove_nested(List, Single_list) :-
  [X|_] = List,
  is_list(X),
  [A|B] = X,
  remove_nested(B, S1),
  append(A,S1,Single_list).


listlen([], 0 ).

listlen([_|Xs] , L ):-
	listlen(Xs,N),
	L is N+1.
