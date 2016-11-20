%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Oct 2016 11:41 PM
%%%-------------------------------------------------------------------
-module(array_of_n_elements).
-author("shako").

%% API
-export([main/0]).

replicate_tail(N) ->replicate_tail(N,[]).
replicate_tail(0,Acc) -> Acc;
replicate_tail(N, Acc) -> replicate_tail(N-1, [N-1|Acc]).


main() ->
  {ok, [N]} = io:fread("", "~d"),
  Arr=replicate_tail(N),
  io:format("~b~n", [Arr]).