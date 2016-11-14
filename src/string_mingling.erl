%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Nov 2016 10:49 PM
%%%-------------------------------------------------------------------
-module(string_mingling).
-author("shako").

%% API
-export([main/0]).

mingle(P,Q) -> mingle(P,Q,[]).
mingle([],[],Acc) -> Acc;
mingle([X|Xs],[Y|Ys],Acc) -> mingle(Xs,Ys,[Acc,X,Y]).

main() ->
  {ok, [P]} = io:fread("", "~s"),
  {ok, [Q]} = io:fread("", "~s"),
  io:format("~s~n", [mingle(P,Q)]).
