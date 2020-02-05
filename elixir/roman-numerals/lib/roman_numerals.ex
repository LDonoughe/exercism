defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    IO.inspect("number")
    IO.inspect(number)
    IO.inspect(Integer.digits(number))
    number
    |> Integer.digits
    # |> List.last
    |> parse_digits
  end



  defp value_to_symbol do
    
  end







  defp parse_digits(digits) do
    digits
    |> left_pad

    "#{parse_ones(List.last(digits))}"
  end

  defp left_pad(digits) do
    if Enum.count(digits) > 3 do
      digits
    else
      left_pad([0] ++ digits)
    end

  end

  defp parse_ones(digit) do
    IO.inspect("digit")
    IO.inspect(digit)
    cond do
      digit < 4 ->
        Enum.reduce(0..digit, "", fn (n, acc) ->
          cond do
            n > 0 ->
              "I#{acc}"
            true ->
              acc
          end
        end)
      digit == 4 ->
        "IV"
      digit == 9 ->
        "IX"
      true ->
        "V#{Enum.reduce(0..(digit - 5), "", fn (n, acc) ->
          cond do
            n > 0 ->
              "I#{acc}"
            true ->
              acc
          end
        end)}"
    end
  end
end
