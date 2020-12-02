-module(day_01a).

solve(InFileLines) -> solve(InFileLines, sets:new()).

solve([], _Set) -> -1; % shoud not happen...
solve([Line | T], Set) ->
    Number = erlang:binary_to_integer(Line),
    case sets:is_element(2020 - Number, Set) of
        true ->
            Number * (2020 - Number);
        false ->
            solve(T, sets:add_element(Number, Set))
    end.