-compile( [{parse_transform, edbc_parse_transform}]).
-include_lib("stdlib/include/assert.hrl").

% A condition to be held BEFORE performing a call.
-define(PRE(FUN), edbc_pre() -> FUN).

% A condition to be held AFTER performing a call.
-define(POST(FUN), edbc_post() -> FUN).

% Checks whether the state satisfies some conditions. 
% It can be only used in gen_server or other behaviours with a internal state.
-define(INVARIANT(FUN), edbc_invariant() -> FUN).

% Checks that a parameter (or a list of parameters) is decreased in recursive calls (only working for self-recursive function now)
-define(DECREASES(PAR), edbc_decreases() -> PAR).

% Checks that the execution time is less or equal than FUN(). Function FUN can include parameters.
-define(EXPECTED_TIME(FUN), edbc_expected_time() -> FUN).

% Cut the execution of a function when its exectution time is longer than FUN(). Function FUN can include parameters.
-define(TIMEOUT(FUN), edbc_timeout() -> FUN).

% Macro for parameters, e.g. P(1) states for the first parameter.
-define(P(N), edbc_p(N)).

% Macro for the result of a function.
-define(R, edbc_r()).



% Not used
% -define(STATE, state()).
% -define(PRE2(FUN), -pre(FUN)).
% -define(PRE_I(FUN), pre(FUN)).
