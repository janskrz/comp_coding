-module(day_01b).

solve(InFileLines) -> solve(InFileLines, []).

solve([], _UncompleteList) -> -1;
solve(_Lines, [A,B,C]) when A + B + C =:= 2020 -> A * B * C;
solve(_Lines, [_A,_B,_C]) -> -1;

solve([Line | T], List) ->
    Number = erlang:binary_to_integer(Line),
    case solve(T, [Number | List]) of
        -1 -> solve(T, List);
        Any -> Any
    end.
