%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Nov 2016 12:20 AM
%%%-------------------------------------------------------------------
-module(camelcase).
-author("shako").

%% API
-export([main/0]).

camelcase(S) -> camelcase(S,1).
camelcase([], Acc) -> Acc;
camelcase([X|S], Acc) when X >= $A , X =< $Z
     -> camelcase(S, Acc+1);
camelcase([_|S], Acc) -> camelcase(S,Acc).


main() ->
  { ok, [S]} = io:fread("", "~s"),
  R = camelcase(S),
  io:format("~p",[R]).