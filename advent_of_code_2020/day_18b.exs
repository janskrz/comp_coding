defmodule Solution do
  def solve() do
    file = File.read!("day_18.in") |> String.split("\n") |> Enum.map(&String.trim/1)

    eval_equations(file) |> Enum.sum()
  end

  def eval_equations([]), do: []

  def eval_equations([eq | t]), do: [eval_eq(eq, 0, "+") | eval_equations(t)]

  def eval_eq("", acc, _), do: acc

  def eval_eq("+" <> rest, acc, _), do: eval_eq(String.trim(rest), acc, "+")
  def eval_eq("*" <> rest, acc, _), do: acc * eval_eq(String.trim(rest), 0, "+")

  def eval_eq("(" <> rest, acc, last_op) do
    {sub, rest_eq} = sub_eq(rest, "", 1)
    val = eval_eq(sub, 0, "+")
    acc = compute(acc, last_op, val)
    eval_eq(String.trim(rest_eq), acc, last_op)
  end

  def eval_eq(eq, acc, last_op) do
    parts = String.split(eq, " ", parts: 2)
    num = String.to_integer(hd(parts))
    acc = compute(acc, last_op, num)

    case length(parts) do
      1 -> acc
      2 -> eval_eq(String.trim(List.last(parts)), acc, last_op)
    end
  end

  def sub_eq("(" <> rest, stored, open_braces), do: sub_eq(rest, stored <> "(", open_braces + 1)
  def sub_eq(")" <> rest, stored, 1), do: {stored, rest}
  def sub_eq(")" <> rest, stored, open_braces), do: sub_eq(rest, stored <> ")", open_braces - 1)

  def sub_eq(seq, stored, open_braces) do
    {h, t} = String.split_at(seq, 1)
    sub_eq(t, stored <> h, open_braces)
  end

  def compute(v1, "+", v2), do: v1 + v2
  def compute(v1, "*", v2), do: v1 * v2
end
