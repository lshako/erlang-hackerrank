%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Oct 2016 11:12 PM
%%%-------------------------------------------------------------------
-module(filter_position).
-author("shako").

%% API
-export([main/0]).

filter(N,P)
  when (P rem 2 =:= 0) ->
  io:format("~p~n", [N]);
filter(_,_) -> ok.

read_input(P) ->
  case io:fread("", "~d") of
    eof -> ok;
    {ok, [N]} -> filter(N,P), read_input(P+1)
  end.

main() ->
  read_input(1).
