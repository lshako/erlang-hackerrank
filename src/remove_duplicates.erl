%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Nov 2016 12:25 AM
%%%-------------------------------------------------------------------
-module(remove_duplicates).
-author("shako").

%% API
-export([main/0]).

remove(S) -> remove(S,[]).
remove([],Acc) -> Acc;
remove([X|Tail],[]) -> remove(Tail, [X]);
remove([X|Tail], Acc)  ->
  case lists:member( X, Acc) of
    true  -> remove(Tail,Acc);
    false -> remove(Tail,Acc++[X])
  end.

main() ->
  {ok, [S]} = io:fread("", "~s"),
  io:format("~s~n", [remove(S)]).
