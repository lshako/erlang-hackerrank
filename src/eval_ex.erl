%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Nov 2016 12:59 PM
%%%-------------------------------------------------------------------
-module(eval_ex).
-author("shako").

%% API
-export([main/0]).

ex(X) -> ex(X,0,0).
ex(_,N,Acc) when N>9 -> Acc;
ex(X,N, Acc) ->ex(X,N+1,Acc+math:pow(X,N)/tail_fac(N)).

tail_fac(N) -> tail_fac(N,1).

tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).

main() ->
  { ok, [N]} = io:fread("", "~d"),
  N_list = lists:seq(1,N),
  lists:foreach( fun(_) ->
    { ok, [X]} = io:fread("", "~f"), io:format("~.4f~n",[ex(X)])
                 end,N_list).
