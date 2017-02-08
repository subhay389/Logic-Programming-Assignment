common-unique-elements-helper(L1,_, Acc, Acc):-
  listlen(L1, Length),
  Length < 1.

common-unique-elements(L1,L2,N):-
  remove_nested(L1, Flat_L1),
  remove_nested(L2, Flat_L2),
  common-unique-elements-helper(Flat_L1, Flat_L2, N, []).

common-unique-elements-helper(L1, L2, N, Acc):-
  [X|Y] = L1,
  not(member(X,L2)),
  common-unique-elements-helper(Y, L2, N, Acc).

common-unique-elements-helper(L1, L2, N, Acc):-
  [X|Y] = L1,
  member(X,Acc),
  common-unique-elements-helper(Y, L2, N, Acc).

common-unique-elements-helper(L1, L2, N, Acc):-
  [X|Y] = L1,
  member(X,L2),
  not(member(X,Acc)),
  common-unique-elements-helper(Y, L2, N, [X|Acc]).

% removing nested loop

remove_nested([],[]).

remove_nested([X|InTail],Out) :-
	remove_nested(X,Flat_list),
	remove_nested(InTail,OutTail),
	append(Flat_list,OutTail,Out).

remove_nested([X|InTail], [X|OutTail]) :-
	X \= [],
	X \= [_|_],
  remove_nested(InTail,OutTail).


listlen([], 0 ).

listlen([_|Xs] , L ):-
	listlen(Xs,N),
	L is N+1.
