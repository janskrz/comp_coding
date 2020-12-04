-module(day_03b).

-define(TREE, 35). %% ASCCI for '#'
-define(FREE, 46). %% ASCCI for '.'

solve(InFileLines) ->
    SlopeList = [{1,1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}],
    Collisions = [slope_colls(InFileLines, Slope) || Slope <- SlopeList],
    io:format("~w~n", [Collisions]),
    lists:foldl(fun(AccIn, E) -> AccIn * E end, 1, Collisions).

slope_colls(InFileLines, Slope={_Right, Down}) ->
    slope_colls(InFileLines, Slope, _UntilNextLine=0, _XPos=0, _Colls=0).

slope_colls([], _Slope, _UntilNextLine, _XPos, Colls) -> Colls;
slope_colls([Line | T], Slope={R,D}, _UntilNextLine=0, XPos, Colls) ->
    XPos1 = XPos rem byte_size(Line),
    case binary:at(Line, XPos1) of
        ?TREE -> slope_colls(T, Slope, D - 1, XPos1 + R, Colls + 1);
        ?FREE -> slope_colls(T, Slope, D - 1, XPos1 + R, Colls)
    end;
slope_colls([_L | T], Slope, UntilNextLine, XPos, Colls) ->
    slope_colls(T, Slope, UntilNextLine - 1, XPos, Colls).

