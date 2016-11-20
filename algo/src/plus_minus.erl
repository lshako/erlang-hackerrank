%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Nov 2016 8:42 PM
%%%-------------------------------------------------------------------
-module(plus_minus).
-author("shako").

%% API
-export([main/0]).

plus_minus(S) ->plus_minus(S,{0,0,0}).
plus_minus([], Acc) -> Acc;
plus_minus([X|S], Acc) when X>0 ->
  {P,N,Z} = Acc,
  plus_minus(S,{P+1,N,Z});
plus_minus([X|S], Acc) when X<0 ->
  {P,N,Z} = Acc,
  plus_minus(S,{P,N+1,Z});
plus_minus([_|S], Acc) ->
  {P,N,Z} = Acc,
  plus_minus(S,{P,N,Z+1}).

main() ->

  { ok, [C]} = io:fread("", "~d"),
  Arr = read_array(C,"~d"),
  {P,N,Z}= plus_minus(Arr),
  io:format("~.6f~n",[P/C]),
  io:format("~.6f~n",[N/C]),
  io:format("~.6f~n",[Z/C]).

read_array(0,_) -> [];
read_array(N,D) ->
  {ok, [X]} = io:fread("", D),
  [X | read_array(N-1,D)].