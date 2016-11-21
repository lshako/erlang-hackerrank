%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Nov 2016 11:40 PM
%%%-------------------------------------------------------------------
-module(mini_max_sum).
-author("shako").

%% API
-export([main/0]).

sum_min_max([X|S]) ->  sum_min_max(S, {X,X,X}).
sum_min_max([], Acc) -> Acc;
sum_min_max([X|S], Acc) -> {Sum, Min, Max} = Acc,
  case X>Max of
    true -> sum_min_max(S,{Sum+X,Min,X});
  false ->
    case X<Min of
      true ->sum_min_max(S, {Sum+X, X, Max});
      false ->sum_min_max(S, {Sum+X, Min, Max})
    end
  end.

main() ->
  Arr = read_array(5,"~d"),
  {Sum, Min, Max} =sum_min_max(Arr),
  io:format("~p ",[Sum-Max]),
  io:format("~p~n",[Sum-Min]).

read_array(0,_) -> [];
read_array(N,D) ->
  {ok, [X]} = io:fread("", D),
  [X | read_array(N-1,D)].