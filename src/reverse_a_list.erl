%%%-------------------------------------------------------------------
%%% @author ludmila
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Oct 2016 09:09
%%%-------------------------------------------------------------------
-module(reverse_a_list).
-author("ludmila").

%% API
-export([main/0]).

read_input(Acc) ->
  case io:fread("", "~d") of
    eof -> {ok,Acc};
    {ok, [X]} -> read_input([X|Acc])
  end.

print([]) -> ok;
print([H|Acc]) ->  io:format("~b~n", [H]),print(Acc).

main() ->
  {ok, Arr} = read_input([]),
  print(Arr).