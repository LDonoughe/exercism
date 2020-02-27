defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  # Copied count from example so I would know what I can use
  @spec count(list) :: non_neg_integer
  def count(l), do: do_count(l, 0)

  defp do_count([], acc), do: acc
  defp do_count([_ | t], acc), do: do_count(t, acc + 1)

  @spec head(list) :: any
  def head(list) do
    [head | _tail] = list
    head
  end

  @spec tail(list) :: list
  def tail(list) do
    [_head | tail] = list
    tail
  end

  @spec prepend(list, any) :: list
  def prepend(list, item) do
    [item | list]
  end

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverse(l, [])
  end

  defp do_reverse([], k), do: k

  defp do_reverse([hd | t], k) do
    do_reverse(t, prepend(k, hd))
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    do_map(reverse(l), f, [])
  end

  defp do_map([], _f, acc), do: acc

  defp do_map([hd | tail], f, acc) do
    do_map(tail, f, prepend(acc, f.(hd)))
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    do_filter(l, f, [])
  end

  @spec do_filter(list, (any -> as_boolean(term)), list) :: list
  def do_filter([], f, acc), do: reverse(acc)
  def do_filter(l, f, acc) do
    x = f.(head(l))
    if x do
      do_filter(tail(l), f, prepend(acc, head(l)))
    else
      do_filter(tail(l), f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, f), do: acc
  def reduce(l, acc, f) do
    reduce(tail(l), f.(head(l), acc), f)
  end

  @spec append(list, list) :: list
  def append([], b), do: b
  def append(a, []), do: a
  def append(a, b) do
    do_append(reverse(a), b)
  end

  def do_append([], b), do: b
  def do_append(a,b) do
    do_append(tail(a), prepend(b,head(a)))
  end

  @spec append_item(list, any) :: list
  def append_item(list, item) do
    reverse(prepend(reverse(list), item))
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
  end
end
