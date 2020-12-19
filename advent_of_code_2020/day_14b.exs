defmodule Solution do
  use Bitwise

  def solve() do
    file = File.read!("day_14.in") |> String.split("\n")
    %{} |> solve(file, "") |> Map.values() |> Enum.sum()
  end

  def solve(mem, [], _mask), do: mem

  def solve(mem, ["mask = " <> mask_str | t], _mask), do: solve(mem, t, String.trim(mask_str))

  def solve(mem, ["mem[" <> rest | t], mask) do
    [loc, _sign, val] = String.split(rest)
    loc = loc |> String.trim("]") |> String.to_integer()
    val = val |> String.trim() |> String.to_integer()

    apply_mask(mem, mask, String.length(mask) - 1, loc, val) |> solve(t, mask)
  end

  def apply_mask(mem, "0" <> rest, i, loc, val), do: apply_mask(mem, rest, i - 1, loc, val)

  def apply_mask(mem, "1" <> rest, i, loc, val),
    do: apply_mask(mem, rest, i - 1, bit_to_one(loc, i), val)

  def apply_mask(mem, "X" <> rest, i, loc, val) do
    mem
    |> apply_mask(rest, i - 1, bit_to_one(loc, i), val)
    |> apply_mask(rest, i - 1, bit_to_zero(loc, i), val)
  end

  def apply_mask(mem, _, _, loc, val), do: Map.put(mem, loc, val)

  def bit_to_one(val, bit), do: val ||| 1 <<< bit

  def bit_to_zero(val, bit), do: val &&& bnot((1 <<< 36) + (1 <<< bit))
end
