%%%-------------------------------------------------------------------
%%% @author ludmila
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Oct 2016 10:06
%%%-------------------------------------------------------------------
-module(sum_of_odd_elements).
-author("ludmila").

%% API
-export([main/0]).

sum(N,Sum)
  when (N rem 2 =/= 0) -> Sum+N;
sum(_,Sum) -> Sum.

read_input(Sum) ->
  case io:fread("", "~d") of
    eof -> {ok,Sum};
    {ok, [N]} -> read_input(sum(N,Sum))
  end.

main() ->
  {ok, Sum} = read_input(0),
  io:format("~b~n", [Sum]).