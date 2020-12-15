defmodule Solution do
  def solve() do
    file = File.read!("day_11.in") |> String.split("\n")
    file = for l <- file, do: String.trim(l)

    rows = length(file)
    columns = String.length(hd(file))

    map =
      for r <- 1..rows, c <- 1..columns do
        {{r, c}, Enum.at(file, r - 1) |> String.at(c - 1)}
      end

    map = Enum.into(map, %{})

    iteration(map, rows, columns) |> count_occupied()
  end

  def iteration(map, row, column) do
    newmap =
      for r <- 1..row, c <- 1..column do
        case {get(map, r, c), neighbors(map, r, c)} do
          {"L", 0} -> {{r, c}, "#"}
          {"#", count} when count >= 4 -> {{r, c}, "L"}
          {any, _} -> {{r, c}, any}
        end
      end

    newmap = Enum.into(newmap, %{})

    case newmap == map do
      true -> newmap
      false -> iteration(newmap, row, column)
    end
  end

  def count_occupied(map) do
    map |> Map.values() |> Enum.count(fn e -> e == "#" end)
  end

  def neighbors(map, r, c) do
    list = [
      get(map, r - 1, c),
      get(map, r + 1, c),
      get(map, r, c + 1),
      get(map, r, c - 1),
      get(map, r - 1, c - 1),
      get(map, r + 1, c + 1),
      get(map, r - 1, c + 1),
      get(map, r + 1, c - 1)
    ]

    Enum.count(list, fn e -> e == "#" end)
  end

  def get(map, r, c) do
    Map.get(map, {r, c}, ".")
  end
end
