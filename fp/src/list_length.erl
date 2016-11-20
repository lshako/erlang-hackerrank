%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Oct 2016 12:58 AM
%%%-------------------------------------------------------------------
-module(list_length).
-author("shako").

%% API
-export([main/0]).

readLines() ->
    readLines(next, []).

readLines(next, InputList) ->
  case io:fread("", "~d") of
    {ok, [N]} -> readLines(next, [N|InputList]);
    eof -> {ok, lists:reverse(InputList)}
  end.

count(List) -> count(List,0).
count([], Acc) -> {ok, Acc};
count([_|Tail], Acc) -> count(Tail, Acc+1).

main() ->
  {ok, Arr} = readLines(),
  {ok, Count} = count(Arr),
  io:format("~b~n", [Count]).