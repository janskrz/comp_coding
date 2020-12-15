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
          {"#", count} when count >= 5 -> {{r, c}, "L"}
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
    list = [{-1, 0}, {1, 0}, {0, 1}, {0, -1}, {-1, 1}, {-1, -1}, {1, 1}, {1, -1}]

    list = for e <- list, do: do_neighbors(map, {r, c}, e)
    Enum.count(list, fn e -> e == "#" end)
  end

  def do_neighbors(m, {r, c}, {dr, dc}) do
    # IO.puts("test #{r} #{c}")
    r = r + dr
    c = c + dc

    case Map.has_key?(m, {r, c}) do
      false ->
        "."

      true ->
        case Map.get(m, {r, c}) do
          "." -> do_neighbors(m, {r, c}, {dr, dc})
          any -> any
        end
    end
  end

  def get(map, r, c) do
    Map.get(map, {r, c}, ".")
  end
end
