% min-above-min(L1, L2 N):-
%	min_in_list(L2, M1),


min_in_list([Min],Min).

min_in_list([H,K|T],M) :-
    number(H),
    number(K),
    H =< K,
    min_in_list([H|T],M).

min_in_list([H,K|T],M) :-
    number(H),
    number(K),
    H > K,
    min_in_list([K|T],M).

min_in_list([H,K|T],M) :-
	not(number(H)),
	min_in_list([K|T],M).

min_in_list([H,K|T],M) :-
	not(number(K)),
	min_in_list([H|T],M).


list_above_min(Min, List, Min_list) :-
	list_above_min_helper(Min, List, [], Min_list).

list_above_min_helper(Min, List, Acc, Acc):-
	listlength[List, Length],
	Length < 1.

list_above_min_helper(Min, List, Min_list, Acc) :-
	listlength[List, Length],
	Length > 0,
	[X|Y] = List,
	number(X),
	X > Min,
	list_above_min_helper(Min, Y, [X|Acc], Min_list ).


listlength([], 0 ).

listlength([_|Xs] , L ):-
	listlength(Xs,N),
	L is N+1.
