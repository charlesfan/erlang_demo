{application, erlang_demo, [
	{description, ""},
	{vsn, "0.1.0"},
	{modules, ['login_handler', 'erlang_demo_app', 'erlang_demo_sup', 'demo_handler']},
	{registered, []},
	{applications, [
		cowboy,
		kernel,
		stdlib
	]},
	{mod, {erlang_demo_app, []}},
	{env, []}
]}.
