board([ [q,q,d,s],
		[q,d,p,s],
		[d,p,p,s],
		[s,s,s,s],
		[s,s,s,s],
		[s,p,p,d],
		[s,p,d,q],
		[s,d,q,q]]).


display_board_letter(B):-
	write('   a b c d'),
	nl,
	write('   - - - -'),
	nl.

/**
display_board_letter(4,8):-
write(' a b c d'),
nl.
*/



display_board([L1|Ls],X,Y,N):-
	display_line_number(N),
	N1 is N+1,
	write('|'),
	display_line(L1),
	nl,
	write('   - - - -'),
	nl,
	display_board(Ls,X,Y,N1).

display_board([],X,Y,_):-
	nl,
	write('player1: '),
	write(X),
	nl,
	write('player2: '),
	write(Y),
	nl, nl.

display_line_number(N):-
	write(N),
	write(' ').

display_line([E|Es]):-
	translate(E,V),
	write(V),
	write('|'),
	display_line(Es).
	
display_line([]).

	
translate(s,' ').
translate(p,'*').
translate(d, 'x').
translate(q, 'X').

read_player(X):-
	write('player name: '),
	read(X),
	nl.

play_game(B,X,Y):-
	board(B),
	read_player(X),
	read_player(Y),
	nl,
	nl,
	display_board_letter(B),
	display_board(B,X,Y,1).