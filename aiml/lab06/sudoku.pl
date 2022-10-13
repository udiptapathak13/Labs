:- dynamic(board/3).

pboard(_, _, 1).
pboard(_, _, 2).
pboard(_, _, 3).
pboard(_, _, 4).
pboard(_, _, 5).
pboard(_, _, 6).
pboard(_, _, 7).
pboard(_, _, 8).
pboard(_, _, 9).

checkRow(X, Y) :- 
    board(X, 0, Y), !;
    board(X, 1, Y), !;
    board(X, 2, Y), !;
    board(X, 3, Y), !;
    board(X, 4, Y), !;
    board(X, 5, Y), !;
    board(X, 6, Y), !;
    board(X, 7, Y), !;
    board(X, 8, Y), !.

checkCol(X, Y) :- 
    board(0, X, Y), !;
    board(1, X, Y), !;
    board(2, X, Y), !;
    board(3, X, Y), !;
    board(4, X, Y), !;
    board(5, X, Y), !;
    board(6, X, Y), !;
    board(7, X, Y), !;
    board(8, X, Y), !.

initBoard :-
    initLoopRow(0).

initLoopRow(9) :- !.
initLoopRow(X) :-
    initLoopCol(X, 0),
    X1 is X + 1,
    initLoopRow(X1).

initLoopCol(_, 9) :- !.
initLoopCol(X, Y) :-
    assertz(board(X, Y, '.')),
    Y1 is Y + 1,
    initLoopCol(X, Y1).
:- dynamic(board/3).

pboard(_, _, 1).
pboard(_, _, 2).
pboard(_, _, 3).
pboard(_, _, 4).
pboard(_, _, 5).
pboard(_, _, 6).
pboard(_, _, 7).
pboard(_, _, 8).
pboard(_, _, 9).

checkRow(X, Y) :- 
    board(X, 0, Y), !;
    board(X, 1, Y), !;
    board(X, 2, Y), !;
    board(X, 3, Y), !;
    board(X, 4, Y), !;
    board(X, 5, Y), !;
    board(X, 6, Y), !;
    board(X, 7, Y), !;
    board(X, 8, Y), !.

checkCol(X, Y) :- 
    board(0, X, Y), !;
    board(1, X, Y), !;
    board(2, X, Y), !;
    board(3, X, Y), !;
    board(4, X, Y), !;
    board(5, X, Y), !;
    board(6, X, Y), !;
    board(7, X, Y), !;
    board(8, X, Y), !.

initBoard :-
    initLoopRow(0).

initLoopRow(9) :- !.
initLoopRow(X) :-
    initLoopCol(X, 0),
    X1 is X + 1,
    initLoopRow(X1).

initLoopCol(_, 9) :- !.
initLoopCol(X, Y) :-
    assertz(board(X, Y, '.')),
    Y1 is Y + 1,
    initLoopCol(X, Y1).

printBoard :-
    printLoopRow(0).

printLoopRow(9) :- !.
printLoopRow(X) :-
    printLoopCol(X, 0),
    nl,
    X1 is X + 1,
    printLoopRow(X1), !.

printLoopCol(_, 9) :- !.
printLoopCol(X, Y) :-
    board(X, Y, Z),
    write(Z),
    write(' '),
    Y1 is Y + 1,
    printLoopCol(X, Y1).

printLoopCol(_, 9) :- !.
printLoopCol(X, Y) :-
    board(X, Y, Z),
    write(Z),
    write(' '),
    Y1 is Y + 1,
    printLoopCol(X, Y1).

solve:- solveLoop(0, 0, 1).

solveLoop(9, _, _) :- !.
solveLoop(X, 9, _) :-
    X1 is X + 1,
    solveLoop(X1, 0, 0).
solveLoop(_, _, 10) :- fail.
solveLoop(X, Y, Z) :-
    \+ checkRow(X, Z),
    \+ checkCol(Y, Z),
    retract(board(X, Y, _)),
    assertz(board(X, Y, Z)),
    Y1 is Y + 1,
    solveLoop(X, Y1, Z),
    retract(board(X, Y, Z)),
    Z1 is Z + 1,
    solveLoop(X, Y, Z1),
    retract(board(X, Y, _)),
    appendz(board(X, Y, '.')).
solveLoop(X, Y, Z) :-
    Z1 is Z + 1,
    solveLoop(X, Y, Z1).