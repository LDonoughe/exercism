defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  @spec char_to_rna(char()) :: char()

  def to_rna(dna) do
    dna
    |> to_charlist()
    |> Enum.map(fn x -> char_to_rna(x) end)
    |> to_string()
    |> to_charlist()
  end

  def char_to_rna(?G) do
    'C'
  end

  def char_to_rna(?T) do
    'A'
  end

  def char_to_rna(?C) do
    'G'
  end

  def char_to_rna(?A) do
    'U'
  end

  def char_to_rna(dna) do
    # just return what we got in if no match
    dna
  end
end
