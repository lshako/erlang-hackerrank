%%%-------------------------------------------------------------------
%%% @author ludmila
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Nov 2016 14:31
%%%-------------------------------------------------------------------
-module(bfsshortreach).
-author("ludmila").

%% API
-export([main/0]).

main() ->
  { ok, [Q]} = io:fread("", "~d"),
  Arr =lists:reverse(read_queries(Q)),
  bfs(Arr).


bfs([]) -> ok;
bfs([X|S]) ->
  {R,N,G} = X,
  len(R,1,N,G),
  bfs(S).

len(R,X,N,G) when X=:=R ->
  len(R, X+1,N,G);
len(_,X,N,_) when X>N ->
  io:format("~n");
len(R,X,N,G) ->
  Path = digraph:get_short_path(G,R,X),
  case Path of
    [_ | P] ->
      io:format("~p ", [length(P)*6]);
    false ->
      io:format("~p ", [-1])
  end,
  len(R, X+1,N,G).

add_vertex(G,0) -> G;
add_vertex(G,N) ->
  digraph:add_vertex(G,N),
  add_vertex(G, N-1).

read_edge(G,0) -> G;
read_edge(G,N) ->
  { ok, [V1,V2]} = io:fread("", "~d~d"),
  Path = digraph:get_path(G, V2, V1),
  case Path of
    false ->
      digraph:add_edge(G, V1, V2),
      digraph:add_edge(G, V2, V1);
    _ ->
      L = length(Path),
      case L >2 of
        true -> digraph:add_edge(G, V1, V2),
                digraph:add_edge(G, V2, V1);
        false -> ok
      end
  end,
  read_edge(G, N-1).

read_queries(Q) ->read_queries(Q,[]).
read_queries(0,Acc) -> Acc;
read_queries(Q,Acc) ->
  { ok, [N,M]} = io:fread("", "~d~d"),
  G = digraph:new(),
  add_vertex(G,N),
  read_edge(G,M),
  { ok, [R] } = io:fread("", "~d"),
  read_queries(Q-1, [{R,N,G}|Acc]).
