-module(simple).
-export([f/1]).

-include_lib("edbc.hrl").


?PRE(fun pre_f/0).
f(0) -> 10;
f(N) -> 
    Prev = f(N-1),
	Prev - 1.
?POST(fun post_f/0).

pre_f() -> 
    case ?P(1) >= 0 of 
        true -> 
            true;
        false -> 
	        {
                false, 
                "The first parameter should be greater than or equal to 0."
            }
    end.

post_f() -> 
    io:format("f(~p) = ~p\n", [?P(1), ?R]),
	?R >= ?P(1).
