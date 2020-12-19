defmodule Board do
  defstruct board: %{}, min_x: 0, max_x: 0, min_y: 0, max_y: 0, min_z: 0, max_z: 0

  def set_cell(b, key = {x, y, z}) do
    %Board{
      board: Map.put(b.board, key, "#"),
      min_x: min(b.min_x, x),
      max_x: max(b.max_x, x),
      min_y: min(b.min_y, y),
      max_y: max(b.max_y, y),
      min_z: min(b.min_z, z),
      max_z: max(b.max_z, z)
    }
  end

  def clear_cell(b, {x, y, z}) do
    %{b | :board => Map.delete(b.board, {x, y, z})}
  end

  def get_neighbors(b, {x, y, z}) do
    entries =
      for i <- (x - 1)..(x + 1),
          j <- (y - 1)..(y + 1),
          k <- (z - 1)..(z + 1),
          {i, j, k} != {x, y, z},
          do: Map.get(b.board, {i, j, k}, ".")

    Enum.count(entries, fn e -> e == "#" end)
  end
end

defmodule Solution do
  def solve() do
    file = File.read!("day_17.in") |> String.split("\n") |> Enum.map(&String.trim/1)

    generate = fill_board(%Board{}, file, 0, 0) |> simulate(1, 6)
    generate.board |> map_size()
  end

  def fill_board(board, [], _x, _y), do: board

  def fill_board(board, ["#" <> rest | t], x, y),
    do: Board.set_cell(board, {x, y, 0}) |> fill_board([rest | t], x + 1, y)

  def fill_board(board, ["." <> rest | t], x, y), do: fill_board(board, [rest | t], x + 1, y)

  def fill_board(board, ["" | t], _x, y), do: fill_board(board, t, 0, y + 1)

  def simulate(board, step, max_step) when step - 1 == max_step, do: board

  def simulate(b, step, max_step) do
    probing =
      for i <- (b.min_x - 1)..(b.max_x + 1),
          j <- (b.min_y - 1)..(b.max_y + 1),
          k <- (b.min_z - 1)..(b.max_z + 1),
          do: {i, j, k}

    board =
      List.foldl(probing, b, fn e, acc ->
        case {Board.get_neighbors(b, e), Map.get(b.board, e, ".")} do
          {count, "#"} when count < 2 or count > 3 ->
            Board.clear_cell(acc, e)

          {3, "."} ->
            Board.set_cell(acc, e)

          _bla ->
            acc
        end
      end)

    simulate(board, step + 1, max_step)
  end
end
