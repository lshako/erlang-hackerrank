%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Oct 2016 10:44 PM
%%%-------------------------------------------------------------------
-module(filter_array).
-author("shako").

%% API
-export([main/0]).

filter(N, X)
  when N < X ->
  io:format("~p~n", [N]);
filter(_,_) -> ok.

read_input(X) ->
  case io:fread("", "~d") of
    eof -> ok;
    {ok, [N]} -> filter(N, X), read_input(X)
  end.

main() ->
  {ok, [X]} = io:fread("", "~d"),
  read_input(X).
