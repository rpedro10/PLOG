
board([ [q,q,d,s],
		[q,d,p,s],
		[d,p,p,s],
		[s,s,s,s],
		[s,s,s,s],
		[s,p,p,d],
		[s,p,d,q],
		[s,d,q,q]]).

		board1([
				[s,s,s,s],
				[p,s,s,s],
				[s,s,s,p],
				[s,s,d,s],
				[s,s,s,s],
				[s,s,s,s],
				[s,s,q,s],
				[s,s,s,s]]).

				board2([
						[q,q,q,q],
						[q,q,q,q],
						[q,q,q,q],
						[q,q,q,q],
						[s,s,s,s],
						[s,p,s,s],
						[p,s,q,s],
						[s,s,s,s]]).


display_board_letter(B):-
	write('    a   b   c   d'),
	nl,
	write('   --------------- '),
	nl.


%half_board(N):- ( N=4 -> write('  =================');write('   ---------------') ).


display_board([L1|Ls],X,Y,N):-

	display_line_number(N),
	N1 is N+1,
	write('|'),
	display_line(L1),
	nl,
	( N=4 -> write('  =================');write('   ---------------') ),
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
	write(' '),
	write(V),
	write(' |'),
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

is_par(J):-
	X is J mod 2,
	X = 0.

move(L, C, J, S1, Ns1, S2, Ns2):-
	(is_par(J) ->  L < 5, Ns1 is S1; L > 4, Ns2 is S2).

ask_play(B, LinhaToMove, ColunaToMove, LinhaDestino, ColunaDestino, Nb, J, S1, Ns1, S2, Ns2) :-
	write('Digite a linha (numero) da peca a mover'), nl,
	getDigit(LinhaToMove),
	%numero(LinhaToMove, X, L1),
	write('Digite a coluna (letra) da peca a mover'), nl,
	getChar(ColunaToMove),
	%letra(ColunaToMove, X, L1),
	letterToNumber(ColunaToMove,Yi),
 	write('Digite a linha (numero) do destino'), nl,
	getDigit(LinhaDestino),
	%numero(LinhaDestino, X, L1),
	write('Digite a coluna (letra) do destino'), nl,
	getChar(ColunaDestino),
	%letra(ColunaDestino, X, L1),
	letterToNumber(ColunaDestino,Yf),
	(move(LinhaToMove, Yi, J, S1, Ns1, S2, Ns2), move_piece(B, LinhaToMove, Yi, LinhaDestino, Yf, Nb, J, S1, Ns1, S2, Ns2) -> true; ask_play(B, L, C, Nl, Nc, Nb, J, S1, Ns1, S2, Ns2)).

display_full_board(B, X, Y, 1):-
display_board_letter(B),
display_board(B,X,Y,1).


play_game(B,X,Y):-
	board2(B),
	%read_player(X),
	%read_player(Y),
	nl,
	nl,
	display_full_board(B, X, Y, 1).

	%display_full_board(Nb, X, Y, 1).
	%queen_can_move(B,1,4,4,1).
	%drone_can_move(B,1,4,3,4).
	%pawn_can_move(B,2,2,1,1).
	%getelem(B,1,1,Elem),
	%ask_play(C,L,NC,NL,X,L1).
	%end_game_p1(B, 1, 1, 1),
	%write('123').
