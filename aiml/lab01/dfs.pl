:- include(set.pl).

getAdj(Vrtx, Res) :- getAdj2(Vrtx, [], Res).

getAdj2(Vrtx, Acc, Res) :-
    edge(Vrtx, Next), 
    \+ lstMem(Acc, Next),
    lstPushB(Acc, Next, Acc2), 
    getAdj2(Vrtx, Acc2, Res), !.
getAdj2(Vrtx, Acc, Acc).

dfs(Start, Res) :- dfs2([Start], [], Res).

dfs2([], Acc, Acc).
dfs2([Head | Tail], Acc, Res) :-
    getAdj(Head, AdjList),
    setUnion(AdjList, Tail, Tmp),
    setDiff(Tmp, Acc, Tmp2),
    write(Tail), nl,
    lstPushB(Acc, Head, Acc2),
    dfs2(Tmp2, Acc2, Res).
