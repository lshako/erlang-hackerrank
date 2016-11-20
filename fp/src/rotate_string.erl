%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Nov 2016 12:14 AM
%%%-------------------------------------------------------------------
-module(rotate_string).
-author("shako").

%% API
-export([main/0]).
rotate(S,0) -> S;
rotate([X|Xs], N) -> rotate(Xs ++ [X], N-1).

print_rotate(S) -> print_rotate(S,length(S)).
print_rotate(_, 0) -> io:format("~n"), ok;
print_rotate(S,N) ->
  NewS = rotate(S,1),
  io:format("~s ", [NewS]),
  print_rotate(NewS,N-1).

rotate_string() ->
  case io:fread("", "~s") of
    eof -> ok;
    {ok, [S]} -> print_rotate(S), rotate_string()
  end.

main() ->
  {ok, [_]} = io:fread("", "~d"),
  rotate_string()
.