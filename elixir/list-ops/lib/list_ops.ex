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

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverse(l,[])
  end

  defp do_reverse([],k), do: k
  defp do_reverse([h1,h2 | t],k) do
    # [h | t] = l
    do_reverse(t,[h2, h1])
  end
  defp do_reverse([h1 | t], k), do: do_reverse(t, h1)

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(l, acc, f) do
  end

  @spec append(list, list) :: list
  def append(a, b) do
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
  end
end
