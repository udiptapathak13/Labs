:- include('bfs.pl').
:- include('dfs.pl').

edge(a, b).
edge(b, a).
edge(a, c).
edge(c, a).
edge(b, d).
edge(d, b).
edge(b, e).
edge(e, b).
edge(e, g).
edge(g, e).
edge(g, h).
edge(h, g).
edge(c, f).
edge(f, c).
edge(f, g).
edge(g, f).

/*
THE GRAPH:

    a
   / \
  b   c
 / \   \
d   e   f
     \ /
      g
       \
        h
*/