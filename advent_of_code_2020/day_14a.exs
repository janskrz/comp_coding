defmodule Solution do
  use Bitwise

  def solve() do
    file = File.read!("day_14.in") |> String.split("\n")

    mem = solve(file, "", %{})
    mem |> Map.values() |> Enum.sum()
  end

  def solve([], _mask, mem), do: mem

  def solve(["mask = " <> mask_str | t], _mask, mem), do: solve(t, mask_str, mem)

  def solve(["mem[" <> rest | t], mask, mem) do
    [loc, _sign, val] = String.split(rest)
    loc = loc |> String.trim("]") |> String.to_integer()
    val = val |> String.trim() |> String.to_integer()

    base = 1 <<< 36

    masked_val =
      Enum.to_list(35..0)
      |> List.foldl(
        val,
        fn i, acc ->
          bit = 35 - i

          case String.at(mask, i) do
            "X" -> acc
            "0" -> acc &&& bnot(base + (1 <<< bit))
            "1" -> acc ||| 1 <<< bit
          end
        end
      )

    solve(t, mask, Map.put(mem, loc, masked_val))
  end
end
