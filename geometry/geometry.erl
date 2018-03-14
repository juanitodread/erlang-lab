-module(geometry).
-export([start/0, area/2, loop/0]).

-define(PI, 3.14159).

start() -> spawn(geometry, loop, []).

area(Pid, What) ->
  rpc(Pid, What).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.

loop() ->
  receive
    {From, {rectangle, Width, Height}} ->
      From ! {self(), Width * Height},
      loop();
    {From, {circle, Radius}} ->
      From ! {self(), ?PI * Radius * Radius},
      loop();
    {From, Other} ->
      From ! {self(), error, Other},
      loop()
  end.