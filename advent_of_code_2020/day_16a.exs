defmodule Solution do
  def solve() do
    file = File.read!("day_16.in") |> String.split("\n") |> Enum.map(&String.trim/1)

    {ranges, ticketnums} = parse(file, :ranges, {[], []})

    not_in_range =
      Enum.filter(
        ticketnums,
        fn e ->
          not Enum.any?(ranges, fn [r_start, r_end] -> r_start <= e and e <= r_end end)
        end
      )

    Enum.sum(not_in_range)
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

  def parse([_ | t], :your, acc), do: parse(t, :your, acc)

  def parse([line | t], :nearby, {ranges, ticketnums}) do
    ticketnums = ticketnums ++ (String.split(line, ",") |> Enum.map(&String.to_integer/1))
    parse(t, :nearby, {ranges, ticketnums})
  end
end
