lstGet([Head | Tail], 1, Head) :- !.
lstGet([_ | Tail], Offset, Element) :-
    Offset2 is Offset - 1,
    lstGet(Tail, Offset2, Element).

lstSet([Head | Tail], 1, Head2, [Head2 | Tail]) :- !.
lstSet([Head | Tail], Offset, Element, [Head | Tail2]) :-
    Offset2 is Offset - 1,
    lstSet(Tail, Offset2, Element, Tail2).

lstMem([Element | Tail], Element) :- !.
lstMem([_ | Tail], Element) :-
    lstMem(Tail, Element).

lstPushF(Lst, Element, [Element | Lst]).

lstPopF([Head | Tail], Tail).

lstEmpty([]).

lstPushB([], Element, [Element]) :- !.
lstPushB([Head | Tail], Element, [Head | Tail2]) :- 
    lstPushB(Tail, Element, Tail2).

lstPopB([Head | []], []) :- !.
lstPopB([Head | Tail], [Head | Tail2]) :- 
    lstPopB(Tail, Tail2).

lstLen(Lst, Length) :- lstLen2(Lst, 0, Length).

lstLen2([], 0, 0) :- !.
lstLen2([], Acc, Acc) :- !.
lstLen2([Head | Tail], Acc, Res) :-
    Acc2 is Acc + 1,
    lstLen2(Tail, Acc2, Res).

lstRev(Lst, Rev) :- lstRev2(Lst, [], Rev).

lstRev2([], Acc, Acc) :- !.
lstRev2([Head | Tail], Acc, Res) :-
    lstPushF(Acc, Head, Acc2),
    lstRev2(Tail, Acc2, Res).