%main funciton

%if L2 is empty
min-above-min(L1, L2, N):-
	listlength(L2, Length),
	Length < 1,
	min_in_list(L1, N).

%if L1 is empty
min-above-min(L1, _, N):-
	listlength(L1, Length),
	Length < 1,
	N is -1.

%if non of the list are empty
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

%base case
list_above_min_helper(_, List, Acc, Acc):-
	listlength(List, Length),
	Length < 1.

%skipping non numeric elements of list
list_above_min_helper(Min, [X|Y],  Acc, Min_list) :-
	not(number(X)),
	list_above_min_helper(Min, Y,  Acc, Min_list).

%if the number of list L2 is greater than min then add to the accumulator
list_above_min_helper(Min, List,  Acc, Min_list) :-
	listlength(List, Length),
	Length > 0,
	[X|Y] = List,
	number(X),
	X > Min,
	list_above_min_helper(Min, Y, [X|Acc], Min_list ).

%if the number of list L2 is smaller than the min then skip 
list_above_min_helper(Min, List, Acc, Min_list) :-
	listlength(List, Length),
	Length > 0,
	[X|Y] = List,
	number(X),
	X =< Min,
	list_above_min_helper(Min, Y, Acc, Min_list ).

%finding the len of list
listlength([], 0 ).

listlength([_|Xs] , L ):-
	listlength(Xs,N),
	L is N+1.
