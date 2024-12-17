defmodule Helper do
  def file(day, test \\ false) do
    "./inputs/#{day}#{if test do
      "test"
    else
      ""
    end}"
  end

  def file_to_numbers(path) do
    File.stream!(path)
    |> Enum.map(&stringtoints/1)
  end

  def stringtoints(string) do
    stringtoints(String.trim(string), [])
  end

  defp stringtoints(string, ints) when string != "" do
    {int, rem} = Integer.parse(string)
    stringtoints(String.trim(rem), ints ++ [int])
  end

  defp stringtoints(_, ints) do
    ints
  end
end
