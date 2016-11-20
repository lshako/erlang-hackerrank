%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Nov 2016 3:17 PM
%%%-------------------------------------------------------------------
-module(permute).
-author("shako").

%% API
-export([main/0]).

permute(S) -> permute(S,[]).
permute([], Acc) -> Acc;
permute([X|[Y|S]], Acc)  -> permute(S,[X|[Y|Acc]]).

main() ->
  { ok, [N]} = io:fread("", "~d"),
  N_list = lists:seq(1,N),
  lists:foreach(
  fun(_) ->
    { ok, [X]} = io:fread("", "~s"),
    R = lists:reverse(permute(X)),
    io:format("~s~n", [R])
  end,N_list).
