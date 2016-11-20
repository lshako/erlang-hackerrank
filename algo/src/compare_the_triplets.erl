%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Nov 2016 7:04 PM
%%%-------------------------------------------------------------------
-module(compare_the_triplets).
-author("shako").

%% API
-export([main/0]).

compare(A,B) when A >B -> {1,0};
compare(A,B) when A < B -> {0,1};
compare(_,_) -> {0,0}.

main() ->
  { ok, [A0,A1,A2]} = io:fread("", "~d~d~d"),
  { ok, [B0,B1,B2]} = io:fread("", "~d~d~d"),
  {A00, B00} = compare(A0,B0),
  {A10, B10} = compare(A1,B1),
  {A20, B20} = compare(A2,B2),
  A= A00 +A10 +A20,
  B = B00 + B10 + B20,
  io:format("~p", [A]),
  io:format(" ~p", [B]).