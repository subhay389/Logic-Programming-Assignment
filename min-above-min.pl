min-above-min(L1, L2, N):-
	min_in_list(L2, Min_of_L2),
	list_above_min(Min_of_L2, L1, New_list),
	min_in_list(New_list, N).



% finding the minimum of the list
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


% creating new list which contains elements only larger than the Min value
list_above_min(Min, List, Min_list) :-
	list_above_min_helper(Min, List, [], Min_list).

list_above_min_helper(_, List, Acc, Acc):-
	listlength(List, Length),
	Length < 1.

list_above_min_helper(Min, [X|Y],  Acc, Min_list) :-
	not(number(X)),
	list_above_min_helper(Min, Y,  Acc, Min_list).

list_above_min_helper(Min, List,  Acc, Min_list) :-
	listlength(List, Length),
	Length > 0,
	[X|Y] = List,
	number(X),
	X > Min,
	list_above_min_helper(Min, Y, [X|Acc], Min_list ).

list_above_min_helper(Min, List, Acc, Min_list) :-
	listlength(List, Length),
	Length > 0,
	[X|Y] = List,
	number(X),
	X =< Min,
	list_above_min_helper(Min, Y, Acc, Min_list ).

listlength([], 0 ).

listlength([_|Xs] , L ):-
	listlength(Xs,N),
	L is N+1.
