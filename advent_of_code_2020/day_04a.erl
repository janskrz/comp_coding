-module(day_04a).

solve(FileInput) ->
    do_solve(FileInput, _CurrPassport = <<>>, _Valid = 0).

do_solve([], CurrPassport, ValidCount) -> new_valid_count(CurrPassport, ValidCount);
do_solve([H | T], CurrPassport, ValidCount) when H =:= <<"">> ->
    do_solve(T, <<>>, new_valid_count(CurrPassport, ValidCount));
do_solve([H | T], CurrPassport, ValidCount) ->
    do_solve(T, <<CurrPassport/binary, <<" ">>/binary, H/binary>>, ValidCount).

new_valid_count(CurrPassport, CurrValidCount) ->
    ToFind = ["byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:"],
    Valid = lists:foldl(
                fun (_E, _AccIn=false)  -> false;
                    (E, _AccIn=true)    -> string:find(CurrPassport, E) =/= nomatch
                end, _Acc0=true, ToFind),
    
    case Valid of
        true -> CurrValidCount + 1;
        false -> CurrValidCount
    end.


