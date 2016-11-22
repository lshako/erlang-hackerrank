%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Nov 2016 8:48 AM
%%%-------------------------------------------------------------------
-module(mars_exploration).
-author("shako").

%% API
-export([main/0]).

mars_exploration(S) -> mars_exploration(S,0,0).
mars_exploration([],_,Acc) ->Acc;
mars_exploration([X|S],N,Acc)
  when (N rem 3 =:= 0) or (N rem 3 =:= 2)->
  case X =:= $S of
    true -> mars_exploration(S,N+1,Acc);
    false -> mars_exploration(S,N+1,Acc+1)
  end;
mars_exploration([X|S],N,Acc)
  when (N rem 3 =:= 1) ->
  case X =:= $O of
  true -> mars_exploration(S,N+1,Acc);
  false -> mars_exploration(S,N+1,Acc+1)
  end.


main() ->
  { ok, [S]} = io:fread("", "~s"),
  R = mars_exploration(S),
  io:format("~p",[R]).