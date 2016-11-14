%%%-------------------------------------------------------------------
%%% @author shako
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Nov 2016 1:27 AM
%%%-------------------------------------------------------------------
-module(string_compression).
-author("shako").

%% API
-export([main/0]).

compression(S) -> compression(S,"",0).
compression([X|S],_,0) -> compression(S,X,1);
compression([],_,0) -> ok;
compression([],Y,N) -> add_in_compression(Y,N);
compression([X|S],Y,N) -> case X=:=Y of
                                 true  -> compression(S,Y,N+1);
                                 false -> add_in_compression(Y,N), compression(S,X,1)
                               end.
add_in_compression(Y, 1) -> P=[Y], io:format("~s", [P]);
add_in_compression(Y, N) -> P=[Y] ++ integer_to_list(N),  io:format("~s",[P]).

main() ->
  {ok, [S]} = io:fread("", "~s"),
  compression(S).

