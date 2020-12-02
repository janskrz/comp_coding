-module(p_020).

-define(ZERO_CHAR, 48).

solve() ->
    FacNumber = lists:foldl(fun(Acc, E) -> Acc * E end, 1, lists:seq(1, 100)),
    DigitList = [C - ?ZERO_CHAR || C <- integer_to_list(FacNumber)],

    lists:sum(DigitList).



