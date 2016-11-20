%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Oct 2016 1:31 AM
%%%-------------------------------------------------------------------
-module('update-list').
-author("shako").

%% API
-export([main/0]).

readLines() ->
  readLines(next, []).

readLines(next, InputList) ->
  case io:fread("", "~d") of
    {ok, [N]} -> readLines(next, [update(N)|InputList]);
    eof -> {ok, lists:reverse(InputList)}
  end.

print([]) -> ok;
print([H|Acc]) ->  io:format("~b~n", [H]),print(Acc).

update(N)
  when N >=0 -> N;
update(N) -> 0-N.



main() ->
  {ok, Arr} = readLines(),
  print(Arr).
