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






%number 3
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




%number 4
%main function
common-unique-elements(L1,L2,N):-
  remove_nested(L1, Flat_L1),
  remove_nested(L2, Flat_L2),
  common-unique-elements-helper(Flat_L1, Flat_L2, N1, []),
  rev(N1, N).

%base case when the list L1 is empty
common-unique-elements-helper(L1,_, Acc, Acc):-
  listlen(L1, Length),
  Length < 1.

%if X is not member of L2
common-unique-elements-helper(L1, L2, N, Acc):-
  [X|Y] = L1,
  not(member(X,L2)),
  common-unique-elements-helper(Y, L2, N, Acc).

%if X already exist in accumulator
common-unique-elements-helper(L1, L2, N, Acc):-
  [X|Y] = L1,
  member(X,Acc),
  common-unique-elements-helper(Y, L2, N, Acc).

%if it is common and not yet in accumulator
common-unique-elements-helper(L1, L2, N, Acc):-
  [X|Y] = L1,
  member(X,L2),
  not(member(X,Acc)),
  common-unique-elements-helper(Y, L2, N, [X|Acc]).

% removing nested loop
% went online for help for this remove_nested logic
remove_nested([],[]).

remove_nested([X|InTail],Out) :-
	remove_nested(X,Flat_list),
	remove_nested(InTail,OutTail),
	append(Flat_list,OutTail,Out).

remove_nested([X|InTail], [X|OutTail]) :-
	not(X = []),
	not(X = [_|_]),
  remove_nested(InTail,OutTail).


listlen([], 0 ).

listlen([_|Xs] , L ):-
	listlen(Xs,N),
	L is N+1.

rev([], []).
rev([X|Y], Z):-
  rev(Y,W),
  append(W,[X],Z).
