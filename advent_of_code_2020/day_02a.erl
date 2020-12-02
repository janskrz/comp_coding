-module(day_02a).

solve(InFileLines) -> solve(InFileLines, 0).

solve([], ValidCount) -> ValidCount;
solve([Line | T], ValidCount) ->
    [Limits, Char, String] = string:split(Line, " ", all),
    [Lower, Upper] = [binary_to_integer(X) || X <- string:split(Limits, "-")],
    Letter = hd(binary:bin_to_list(string:slice(Char, 0, 1))),
    Occurences = count_letter(binary:bin_to_list(String), Letter, 0),
    case Occurences >= Lower andalso Occurences =< Upper of
        true -> solve(T, ValidCount + 1);
        false -> solve(T, ValidCount)
    end.

count_letter([], _Letter, Count) -> Count;
count_letter([Letter|T], Letter, Count) -> count_letter(T, Letter, Count+1);
count_letter([_H|T], Letter, Count) -> count_letter(T, Letter, Count).