defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> Integer.digits()
    |> parse_digits
  end

  defp parse_digits(digits) do
    digits =
      digits
      |> left_pad

    [thous | digits] = digits
    [hund | digits] = digits
    [tens | digits] = digits
    [ones | _digits] = digits

    "#{parse_thous(thous)}#{parse_hund(hund)}#{parse_tens(tens)}#{parse_ones(ones)}"
  end

  defp left_pad(digits) do
    if Enum.count(digits) > 3 do
      digits
    else
      left_pad([0] ++ digits)
    end
  end

  defp parse_thous(digit) do
    # Values over three thousand are undefined
    parse_digit(digit, "M", "", "")
  end

  defp parse_hund(digit) do
    parse_digit(digit, "C", "D", "M")
  end

  defp parse_tens(digit) do
    parse_digit(digit, "X", "L", "C")
  end

  defp parse_ones(digit) do
    parse_digit(digit, "I", "V", "X")
  end

  defp parse_digit(digit, one, five, ten) do
    cond do
      digit < 4 ->
        Enum.reduce(0..digit, "", fn n, acc ->
          cond do
            n > 0 ->
              "#{one}#{acc}"

            true ->
              acc
          end
        end)

      digit == 4 ->
        "#{one}#{five}"

      digit == 9 ->
        "#{one}#{ten}"

      true ->
        "#{five}#{
          Enum.reduce(0..(digit - 5), "", fn n, acc ->
            cond do
              n > 0 ->
                "#{one}#{acc}"

              true ->
                acc
            end
          end)
        }"
    end
  end
end
