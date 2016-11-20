%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2016 1:06 AM
%%%-------------------------------------------------------------------
-module(prefix_compression).
-author("shako").

%% API
-export([main/0]).

prefix_compression(X,Y) ->prefix_compression(X,Y,[]).

prefix_compression([],Y,Acc) ->{[],Y,Acc};
prefix_compression(X,[],Acc) ->{X,[],Acc};
prefix_compression([X1|X], [Y1|Y], Acc)
  when (X1 =:= Y1) -> prefix_compression(X,Y,[X1|Acc]);
prefix_compression(X,Y,Acc) -> {X,Y,Acc}.

main() ->
  {ok, [X]} = io:fread("", "~s"),
  {ok, [Y]} = io:fread("", "~s"),
  P = prefix_compression(X,Y),
  X1= element(1, P),
  Y1= element(2, P),
  Pr = lists:reverse(element(3,P)),
  io:format("~p ~s~n", [length(Pr) , Pr]),
  io:format("~p ~s~n", [length(X1) , X1]),
  io:format("~p ~s~n", [length(Y1) , Y1]).