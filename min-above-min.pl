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
