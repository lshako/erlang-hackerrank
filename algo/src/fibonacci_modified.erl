
%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Nov 2016 5:46 PM
%%%-------------------------------------------------------------------
-module(fibonacci_modified).
-author("shako").

%% API
-export([main/0]).

fib(T1, _, 1) -> T1;
fib(_, T2, 2) -> T2;
fib(T1, T2, N) -> fib(T1,T2, N-2, 3).
fib(T1, T2, 1, _) -> T1 +T2*T2;
fib(T1, T2, N, I) -> fib(T2, T1 +T2*T2, N-1, I+1).

main() ->
  {ok, [T1]} = io:fread("", "~d"),
  {ok, [T2]} = io:fread("", "~d"),
  {ok, [N]} = io:fread("", "~d"),
  R =fib(T1,T2,N),
  io:format("~p~n", [R]).