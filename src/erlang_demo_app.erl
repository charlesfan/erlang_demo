-module(erlang_demo_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
        {'_', [{"/", demo_handler, []},
	{"/login", login_handler, []}
	]}
    ]),
    cowboy:start_http(my_http_listener, 100, [{port, 8080}],
        [{env, [{dispatch, Dispatch}]}]
    ),
	erlang_demo_sup:start_link().

stop(_State) ->
	ok.
