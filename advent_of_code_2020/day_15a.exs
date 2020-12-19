defmodule Solution do
  def solve() do
    input = [9, 12, 1, 4, 17, 0, 18]

    {i, map} =
      input
      |> List.foldl({1, %{}}, fn e, {idx, acc} ->
        {idx + 1, Map.put(acc, e, idx)}
      end)

    play(map, 0, i, _limit = 30_000_000)
  end

  def play(_map, last_num, idx, limit) when idx == limit, do: last_num

  def play(map, last_num, idx, limit) do
    next_num =
      case Map.get(map, last_num) do
        nil ->
          0

        pos ->
          idx - pos
      end

    map = Map.put(map, last_num, idx)
    play(map, next_num, idx + 1, limit)
  end
end
