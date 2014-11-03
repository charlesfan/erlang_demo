-module(login_handler).

-export([init/3]).
-export([is_authorized/2]).
-export([terminate/3]).
-export([content_types_provided/2]).
-export([text/2]).

init(_Transport, _Req, []) ->
	{upgrade, protocol, cowboy_rest}.

is_authorized(Req, State) ->
	{ok, Auth, Req1} = cowboy_req:parse_header(<<"authorization">>, Req),
	case Auth of
		{<<"basic">>, {User = <<"charles">>, <<"1234">>}}
->	
		{true, Req1, User};
	     _ ->
		{{false, <<"Basic realm=\"Login page\"">>}, Req1, State}
	end.

content_types_provided(Req, State) ->
     {[
         {<<"text/plain">>, text}
     ], Req, State}.

text(Req, User) ->
     {<< "Hello, ", User/binary, "!\n" >>, Req, User}.

terminate(_Reason, _Req, _State) ->
	ok.

