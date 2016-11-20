%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Nov 2016 12:05 AM
%%%-------------------------------------------------------------------
-module(string_reductions).
-author("shako").

%% API
-export([main/0]).

main() ->
  {ok, [S]} = io:fread("", "~s"),
  P=lists:reverse(reduction(S)),
  io:format("~s", [P]).

reduction(S) -> reduction(S,[]).
reduction([], Acc)-> Acc;
reduction([X|S], Acc) ->
  case string:str(Acc, [X]) > 0 of
    true -> reduction(S,Acc);
    false -> reduction(S,[X|Acc])
  end.