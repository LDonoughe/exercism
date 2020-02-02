defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  @spec count_next_word(map, [String.t()]) :: map
  def count(sentence) do
    # Handle special cases up front
    count_next_word(%{}, String.split(Regex.replace(~r/[!:&@$%^\.,]/, sentence, ""), ~r/[\s_]/))
  end

  # Base Case
  defp count_next_word(map, words) when length(words) == 0 do
    Map.delete(map, "")
  end

  # Recursively generate map from sentence
  defp count_next_word(map, words) do
    word = String.downcase(hd(words))

    val = Map.get(map, word,0)

    count_next_word(Map.put(map, word, val + 1), tl(words))
  end
end
