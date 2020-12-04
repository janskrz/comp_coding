-module(day_03a).

-define(TREE, 35). %% ASCCI for '#'
-define(FREE, 46). %% ASCCI for '.'

solve(InFileLines) -> solve(InFileLines, 0, 0).

solve([], _XPos, Trees) -> Trees;
solve([Line | T], XPos, Trees) ->
    XPos1 = XPos rem byte_size(Line),
    case binary:at(Line, XPos1) of
        ?TREE -> solve(T, XPos1 + 3, Trees + 1);
        ?FREE -> solve(T, XPos1 + 3, Trees)
    end.

