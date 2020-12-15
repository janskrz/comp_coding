defmodule Solution do
  def solve() do
    file = File.read!("day_12.in") |> String.split("\n")
    file = for l <- file, do: String.split_at(l, 1)
    file = for {i, num} <- file, do: {i, String.trim(num) |> String.to_integer()}

    pos = {x, y} = do_simulate(file, {0, 0}, _dir = 0)
    dist = abs(x) + abs(y)
    IO.puts("We are at #{inspect(pos)}, manhatten distance is #{dist}")
  end

  def do_simulate(instr = [h | _], pos, dir) do
    IO.puts("#{inspect(h)}  #{inspect(pos)} #{dir}")
    simulate(instr, pos, dir)
  end

  def simulate([], pos, _), do: pos

  def do_simulate(instr = [], pos, dir), do: pos

  def simulate(instr, pos, dir) when dir < 0, do: do_simulate(instr, pos, 4 + dir)
  def simulate(instr, pos, dir) when dir > 3, do: do_simulate(instr, pos, dir - 4)

  def simulate([{"W", amount} | t], {x, y}, dir), do: do_simulate(t, {x - amount, y}, dir)
  def simulate([{"E", amount} | t], {x, y}, dir), do: do_simulate(t, {x + amount, y}, dir)
  def simulate([{"N", amount} | t], {x, y}, dir), do: do_simulate(t, {x, y + amount}, dir)
  def simulate([{"S", amount} | t], {x, y}, dir), do: do_simulate(t, {x, y - amount}, dir)

  def simulate([{"R", amount} | t], {x, y}, dir),
    do: do_simulate(t, {x, y}, dir + div(amount, 90))

  def simulate([{"L", amount} | t], {x, y}, dir),
    do: do_simulate(t, {x, y}, dir - div(amount, 90))

  def simulate([{"F", amount} | t], pos, dir) do
    case dir do
      0 -> simulate([{"E", amount} | t], pos, dir)
      1 -> simulate([{"S", amount} | t], pos, dir)
      2 -> simulate([{"W", amount} | t], pos, dir)
      3 -> simulate([{"N", amount} | t], pos, dir)
    end
  end
end
