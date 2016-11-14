%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Nov 2016 9:36 PM
%%%-------------------------------------------------------------------
-module(pascals_triangle).
-author("shako").

%% API
-export([main/0]).

tail_fac(N) -> tail_fac(N,1).

tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).

pascals_triangle_value(N,R) when R>N -> ok;
pascals_triangle_value(N,R) ->
  io:format("~p ", [round(tail_fac(N)/(tail_fac(R)*tail_fac(N-R)))]),
  pascals_triangle_value(N,R+1).


pascals_triangle(K, I) when I<K ->
  pascals_triangle_value(I,0),
  io:format("~n", []),
  pascals_triangle(K,I+1);
pascals_triangle(_, _)  -> ok.


main() ->
  {ok, [K]} = io:fread("", "~d"),
  pascals_triangle(K+1,0).