-module(day_02b).

solve(InFileLines) -> solve(InFileLines, 0).

solve([], ValidCount) -> ValidCount;
solve([Line | T], ValidCount) ->
    [Limits, Char, String] = string:split(Line, " ", all),
    [Lower, Upper] = [binary_to_integer(X) || X <- string:split(Limits, "-")],
    Letter = hd(binary:bin_to_list(string:slice(Char, 0, 1))),
    Letters = binary:bin_to_list(String),
    case (lists:nth(Lower, Letters) =:= Letter) xor (lists:nth(Upper, Letters) =:= Letter) of
        true -> solve(T, ValidCount + 1);
        false -> solve(T, ValidCount)
    end.

