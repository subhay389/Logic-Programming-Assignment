
% removing nested loop

remove_nested([],[]).

remove_nested([Head|InTail],Out) :-
	remove_nested(Head,Flat_list),
	remove_nested(InTail,OutTail),
	append(Flat_list,OutTail,Out).

remove_nested([Head|InTail], [Head|OutTail]) :-
	Head \= [],
	Head \= [_|_],
  remove_nested(InTail,OutTail).

%finding list length
listlen([], 0 ).

listlen([_|Xs] , L ):-
	listlen(Xs,N),
	L is N+1.
