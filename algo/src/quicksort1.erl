%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Nov 2016 9:09 AM
%%%-------------------------------------------------------------------
-module(quicksort1).
-author("shako").

%% API
-export([main/0]).

partition(X,S) ->partition(X,S,[],[]).
partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
  if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
    H >  Pivot -> partition(Pivot, T, Smaller, [H|Larger])
  end.

print([]) -> ok;
print([H|Acc]) ->  io:format("~p ", [H]), print(Acc).


main() ->
  { ok, [N]} = io:fread("", "~d"),
  Arr = read_array(N,"~d"),
  [X|S] = Arr,
  {Smaller,Larger} = partition(X, S),
  print(lists:reverse(Smaller)),
  io:format("~p ", [X]),
  print(lists:reverse(Larger)).


read_array(0,_) -> [];
read_array(N,D) ->
  {ok, [X]} = io:fread("", D),
  [X | read_array(N-1,D)].