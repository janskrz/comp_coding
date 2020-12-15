defmodule Solution do
  def solve() do
    file = File.read!("day_12.in") |> String.split("\n")
    file = for l <- file, do: String.split_at(l, 1)
    file = for {i, num} <- file, do: {i, String.trim(num) |> String.to_integer()}

    pos = {x, y} = do_simulate(file, {0, 0}, {10, 1})
    dist = abs(x) + abs(y)
    IO.puts("We are at #{inspect(pos)}, manhatten distance is #{dist}")
  end

  def simulate([], pos, _), do: pos

  def simulate([{"W", amount} | t], pos, {x, y}), do: simulate(t, pos, {x - amount, y})
  def simulate([{"E", amount} | t], pos, {x, y}), do: simulate(t, pos, {x + amount, y})
  def simulate([{"N", amount} | t], pos, {x, y}), do: simulate(t, pos, {x, y + amount})
  def simulate([{"S", amount} | t], pos, {x, y}), do: simulate(t, pos, {x, y - amount})

  def simulate([{"R", amount} | t], pos, {dx, dy}) do
    case div(amount, 90) do
      1 -> simulate(t, pos, {dy, -dx})
      2 -> simulate(t, pos, {-dx, -dy})
      3 -> simulate(t, pos, {-dy, dx})
    end
  end

  def simulate([{"L", amount} | t], pos, {dx, dy}) do
    case div(amount, 90) do
      3 -> simulate(t, pos, {dy, -dx})
      2 -> simulate(t, pos, {-dx, -dy})
      1 -> simulate(t, pos, {-dy, dx})
    end
  end

  def simulate([{"F", a} | t], {px, py}, {dx, dy}),
    do: simulate(t, {px + a * dx, py + a * dy}, {dx, dy})
end
