:- include('lst.pl').

setMake(X, Y) :- setMake2(X, [], Y).

setMake2([], Acc, Acc) :- !.
setMake2([Head | Tail], Acc, Set) :-
    \+ lstMem(Acc, Head), 
    lstPushB(Acc, Head, Acc2), 
    setMake2(Tail, Acc2, Set), !.
setMake2([_ | Tail], Acc, Set) :-
    setMake2(Tail, Acc, Set).

setPushF(Old, Element, New) :-
    \+ lstMem(Old, Element),
    lstPushF(Old, Element, New), !.
setPushF(Old, Element, Old).

setPushB(Old, Element, New) :-
    \+ lstMem(Old, Element),
    lstPushB(Old, Element, New), !.
setPushB(Element, Old, Old).

setPopF(Set, X) :- lstPopF(Set, X).

setPopB(Set, X) :- lstPopB(Set, X).

setUnion(SetA, SetB, Res) :- 
    lstRev(SetA, SetAR),
    setUnion2(SetAR, SetB, [], Res).

setUnion2([], [], Acc, Acc) :- !.
setUnion2([Head | Tail], [], Acc, Res) :-
    setPushF(Acc, Head, Acc2),
    setUnion2(Tail, [], Acc2, Res), !.
setUnion2(SetA, SetB, [], Res) :-
    setUnion2(SetA, [], SetB, Res).

setIntersect(SetA, SetB, Res) :- 
    sort(SetA, SetAS),
    sort(SetB, SetBS),
    setIntersect2(SetAS, SetBS, [], Res).

setIntersect2(X, [], Acc, Acc) :- !.
setIntersect2([], X, Acc, Acc) :- !.
setIntersect2([Head | Tail], [Head | Tail2], Acc, Res) :-
    lstPushB(Acc, Head, Acc2), 
    setIntersect2(Tail, Tail2, Acc2, Res), !.
setIntersect2([Head | Tail], [Head2 | Tail2], Acc, Res) :-
    Head > Head2,
    setIntersect2([Head | Tail], Tail2, Acc, Res), !.
setIntersect2([Head | Tail], [Head2 | Tail2], Acc, Res) :-
    Head < Head2,
    setIntersect2(Tail, [Head2 | Tail2], Acc, Res).

setDiff(SetA, SetB, Res) :- setDiff2(SetA, SetB, [], Res).

setDiff2([], _, Acc, Acc) :- !.
setDiff2([Head | Tail], Set, Acc, Res) :-
    \+ lstMem(Set, Head),
    lstPushB(Acc, Head, Acc2),
    setDiff2(Tail, Set, Acc2, Res), !.
setDiff2([Head | Tail], Set, Acc, Res) :-
    setDiff2(Tail, Set, Acc, Res).