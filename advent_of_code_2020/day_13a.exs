defmodule Solution do
  def solve() do
    leave_time = 1_001_287

    buses =
      "13,x,x,x,x,x,x,37,x,x,x,x,x,461,x,x,x,x,x,x,x,x,x,x,x,x,x,17,x,x,x,x,19,x," <>
        "x,x,x,x,x,x,x,x,29,x,739,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,x,x,x,23"

    buses = buses |> String.split(["x", ","], trim: true)
    buses = for b <- buses, do: String.to_integer(b)

    {time, id} =
      List.foldl(buses, {-1, -1}, fn
        e, {-1, -1} ->
          {leave_time + e - rem(leave_time, e), e}

        e, acc ->
          newtime = {leave_time + e - rem(leave_time, e), e}
          min(newtime, acc)
      end)

    IO.puts("Taking bus #{id} at time #{time} (Solution #{(time - leave_time) * id})")
  end
end
