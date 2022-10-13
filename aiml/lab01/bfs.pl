-:- include('set.pl').

getAdj(Vrtx, Res) :- getAdj2(Vrtx, [], Res).

getAdj2(Vrtx, Acc, Res) :-
    edge(Vrtx, Next), 
    \+ lstMem(Acc, Next),
    lstPushB(Acc, Next, Acc2), 
    getAdj2(Vrtx, Acc2, Res), !.
getAdj2(Vrtx, Acc, Acc).

bfs(Start, Res) :- bfs2([Start], [], Res).

bfs2([], Acc, Acc).
bfs2([Head | Tail], Acc, Res) :-
    getAdj(Head, AdjList),
    lstRev(AdjList, AdjList2),
    lstRev(Tail, Tail2),
    setUnion(AdjList2, Tail2, Tmp),
    lstRev(Tmp, Tmp2),
    setDiff(Tmp2, Acc, Tmp3),
    lstPushB(Acc, Head, Acc2),
    bfs2(Tmp3, Acc2, Res).
