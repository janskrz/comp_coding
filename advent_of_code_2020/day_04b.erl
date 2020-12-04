-module(day_04b).

solve(FileInput) ->
    do_solve(FileInput, _CurrPassport = <<>>, _Valid = 0).

do_solve([], CurrPassport, ValidCount) ->
    new_valid_count(CurrPassport, ValidCount);
do_solve([H | T], CurrPassport, ValidCount) when H =:= <<"">> ->
    do_solve(T, <<>>, new_valid_count(CurrPassport, ValidCount));
do_solve([H | T], CurrPassport, ValidCount) ->
    do_solve(T, <<CurrPassport/binary, <<" ">>/binary, H/binary>>, ValidCount).

new_valid_count(CurrPassport, CurrValidCount) ->
    Constraints = [
        {"byr:", fun val_bry/1},
        {"iyr:", fun val_iyr/1},
        {"eyr:", fun val_eyr/1},
        {"pid:", fun val_pid/1},
        {"hgt:", fun val_hgt/1},
        {"hcl:", fun val_hcl/1},
        {"ecl:", fun val_ecl/1}
    ],
    Valid = lists:foldl(
                fun (_E, _AccIn=false)  -> false;
                    (E, _AccIn=true)    -> validate_field(CurrPassport, E)
                end, _Acc0=true, Constraints),

    case Valid of
        true -> CurrValidCount + 1;
        false -> CurrValidCount
    end.

validate_field(PassPort, {FieldName, Predicate}) ->
    case string:find(PassPort, FieldName, leading) of
        nomatch -> false;
        SubStr ->
            FieldVal = lists:nth(2, string:lexemes(SubStr, ": ")),
            Predicate(FieldVal)
    end.

val_bry(Value) -> val_num_str(Value, 4, 1920, 2002).
val_iyr(Value) -> val_num_str(Value, 4, 2010, 2020).
val_eyr(Value) -> val_num_str(Value, 4, 2020, 2030).
val_pid(Value) -> val_num_str(Value, 9, 0, 999999999).
val_hgt(Value) ->
    Options = [{<<"cm">>, 150, 193}, {<<"in">>, 59, 76}],
    lists:foldl(
        fun ({Unit, Lo, Hi}, AccIn) ->
            case string:find(Value, Unit, trailing) of
                nomatch -> AccIn orelse false;
                _ ->
                    case string:to_integer(Value) of
                        {Int, Unit} ->
                            AccIn orelse (Int >= Lo andalso Int =< Hi);
                        _ ->
                            AccIn orelse false
                    end
            end
        end, false, Options).
val_hcl(Value) ->
    Regex = "#" ++ lists:flatten(lists:duplicate(6, "([0-9]|[a-f])")),
    case re:run(Value, Regex) of
        nomatch -> false;
        _ -> true
    end.

do_val_ecl(_Value, []) -> false;
do_val_ecl(Value, [Value | _T]) -> true;
do_val_ecl(Value, [_H | T]) -> do_val_ecl(Value, T).
val_ecl(Value) ->
    do_val_ecl(Value, [<<"amb">>,<<"blu">>,<<"brn">>,<<"gry">>,<<"grn">>,<<"hzl">>,<<"oth">>]).


val_num_str(Str, Length, LowerBound, UpperBound) ->
    Regex = lists:flatten(lists:duplicate(Length, "\\d")),
    case re:run(Str, Regex) of
        nomatch -> false;
        {match, _} ->
            {Int, _Rest} = string:to_integer(Str),
            Int >= LowerBound andalso Int =< UpperBound
    end.


