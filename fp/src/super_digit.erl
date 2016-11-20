%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Nov 2016 12:31 AM
%%%-------------------------------------------------------------------
-module(super_digit).
-author("shako").

%% API
-export([main/0]).

min_k(K) when (K>9) -> case K rem 10 =:= 0 of
                         true -> min_k(trunc(K/10));
                         false ->K
                       end;
min_k(K) -> K.

super_digit(S) -> super_digit(S,0).
super_digit(0,Acc) ->
  case (Acc/10 <1) of
    true -> Acc;
    false -> super_digit(Acc, 0)
  end;
super_digit(S, Acc) ->
  B = S rem 10,
  A = trunc(S/10),
  super_digit(A, Acc + B).

str_digit(S) -> str_digit(S,0).
str_digit([], Acc) -> Acc;
str_digit([X|S], Acc) -> str_digit(S, Acc + list_to_integer([X])).

main() ->
  {ok, [N]} = io:fread("", "~s"),
  {ok, [K]} = io:fread("", "~d"),
  MK =trunc(min_k(K)),
  %F = first_super_digit(N,MK),
  %D = super_digit(F),
  D = super_digit(str_digit(N)*MK),
  io:format("~p~n", [D]).

