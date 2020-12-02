-module(run_solution).

-export([run_solution/1]).

run_solution([Problem]) ->
    ProblemNum = lists:flatten(io_lib:format("~3..0s", [Problem])),
    ModuleName = list_to_atom(atom_to_list(day_) ++ ProblemNum),
    InFile = atom_to_list(day_) ++ ProblemNum ++ ".in",

    compile:file(ModuleName, export_all),
    ReadResult = file:read_file(InFile),
    StartTime = erlang:monotonic_time(microsecond),
    Solution =
        case ReadResult of
            {ok, Binary} -> ModuleName:solve(binary:split(Binary, <<"\n">>, [global]));
            _ -> ModuleName:solve()
        end,
    EndTime = erlang:monotonic_time(microsecond),

    io:format("The result of problem ~s is: ~p~nIt took me ~p milliseconds. ~n",
        [Problem, Solution, (EndTime - StartTime) / 1000]),

    init:stop(0).