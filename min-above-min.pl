min_in_list([Min],Min).                 

min_in_list([H,K|T],M) :-
    H =< K,                             
    min_in_list([H|T],M).               

min_in_list([H,K|T],M) :-
    H > K,                              
    min_in_list([K|T],M). 