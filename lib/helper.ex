defmodule Helper do
  def file_to_numbers(day) do
    File.stream!("./inputs/#{day}")
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
