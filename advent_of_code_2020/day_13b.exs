defmodule Solution do
  def solve() do
    # "17,x,13,19"
    # "7,13,x,x,59,x,31,19"
    buses =
      "13,x,x,x,x,x,x,37,x,x,x,x,x,461,x,x,x,x,x,x,x,x,x,x,x,x,x,17,x,x,x,x,19,x," <>
        "x,x,x,x,x,x,x,x,29,x,739,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,x,x,x,23"

    buses = buses |> String.replace("x", "1") |> String.split([","], trim: true)
    buses = for b <- buses, do: String.to_integer(b)

    buses =
      buses
      |> Enum.with_index()

    [h | t] = buses

    step =
      t
      |> Enum.map(fn e ->
        find_begin_and_phase(h, e, 0, {-1, -1})
      end)

    step(step)
  end

  def find_begin_and_phase({e1, i1}, {e2, i2}, pos, ret) do
    # IO.puts("#{e1} #{e2} #{i1} #{i2} #{pos} #{rem(pos, e2)} #{i2}")

    case rem(pos + i2, e2) == 0 do
      true ->
        case ret do
          {-1, -1} -> find_begin_and_phase({e1, i1}, {e2, i2}, pos + e1, {pos, -1})
          {a, -1} -> {pos - a, a}
        end

      false ->
        find_begin_and_phase({e1, i1}, {e2, i2}, pos + e1, ret)
    end
  end

  def step([{a, b} | []]), do: {a, b}

  def step(list) do
    list =
      list
      |> Enum.sort()
      |> Enum.reverse()

    IO.puts("#{inspect(list)}")
    [{p, o} | t] = list

    t
    |> Enum.map(fn e ->
      compute({p, o}, e, o, {-1, -1})
    end)
    |> step()
  end

  def compute({r1, o1}, {r2, o2}, pos, ret) do
    case rem(pos, r2) == o2 do
      true ->
        case ret do
          {-1, -1} -> compute({r1, o1}, {r2, o2}, pos + r1, {-1, pos})
          {-1, a} -> {pos - a, a}
        end

      false ->
        compute({r1, o1}, {r2, o2}, pos + r1, ret)
    end
  end
end
