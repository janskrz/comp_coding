defmodule Solution do
  def solve() do
    file = File.read!("day_16.in") |> String.split("\n") |> Enum.map(&String.trim/1)

    {ranges, ticketnums} = parse(file, :ranges, {[], []})
    ranges = Enum.chunk_every(ranges, 2) |> Enum.reverse() |> Enum.with_index(1)

    matching =
      for field <- ticketnums do
        Enum.filter(
          ranges,
          fn {[[r1_start, r1_end], [r2_start, r2_end]], idx} ->
            valid =
              Enum.all?(
                field,
                fn n ->
                  (r1_start <= n and n <= r1_end) or (r2_start <= n and n <= r2_end)
                end
              )
          end
        )
        |> Enum.map(fn e -> elem(e, 1) end)
      end

    matching |> Enum.with_index(1) |> Enum.sort_by(fn e -> elem(e, 0) |> (length / 1) end)

    # then look for the first occurences of number 1...6
    # these indizes are the positions in our ticket that has to be multiplied
    # but this problem was not fun and therefore I am too lazy
    # Solution (manually) 83 * 157 * 131 * 163 * 61 * 137 = 2325343130651
  end

  def parse([], _, acc), do: acc
  def parse(["" | t], area, acc), do: parse(t, area, acc)
  def parse(["your ticket" <> _rest | t], :ranges, acc), do: parse(t, :your, acc)
  def parse(["nearby ticket" <> _rest | t], :your, acc), do: parse(t, :nearby, acc)

  def parse([line | t], :ranges, {range_acc, ticketnums_acc}) do
    new_ranges = line |> String.split() |> Enum.filter(fn e -> String.contains?(e, "-") end)

    new_ranges =
      for r <- new_ranges do
        String.split(r, "-") |> Enum.map(&String.to_integer/1)
      end

    parse(t, :ranges, {new_ranges ++ range_acc, ticketnums_acc})
  end

  def parse([line | t], :your, {ranges, _}) do
    ticketnums = String.split(line, ",") |> Enum.map(fn e -> [String.to_integer(e)] end)
    parse(t, :your, {ranges, ticketnums})
  end

  def parse([line | t], :nearby, {ranges, ticketnums}) do
    nums = String.split(line, ",") |> Enum.map(&String.to_integer/1)

    case is_valid(ranges, nums) do
      true ->
        nums =
          for {new, old} <- Enum.zip(nums, ticketnums) do
            [new | old]
          end

        parse(t, :nearby, {ranges, nums})

      false ->
        parse(t, :nearby, {ranges, ticketnums})
    end
  end

  def is_valid(ranges, nums) do
    not_in_range =
      Enum.filter(
        nums,
        fn e ->
          not Enum.any?(ranges, fn [r_start, r_end] -> r_start <= e and e <= r_end end)
        end
      )

    not_in_range == []
  end
end
