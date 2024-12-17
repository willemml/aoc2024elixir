defmodule Aoc1 do
  defp input(test) do
    Helper.file_to_numbers(Helper.file(1, test))
    |> Stream.map(&List.to_tuple/1)
    |> Enum.unzip()
  end

  def part1(test \\ false) do
    {a, b} = input(test)
    Enum.zip_reduce(Enum.sort(a), Enum.sort(b), 0, fn t1, t2, acc -> acc + abs(t1 - t2) end)
  end

  def part2(test \\ false) do
    {a, b} = input(test)

    for n <- a, reduce: 0 do
      acc -> acc + n * Enum.count(b, fn b -> n == b end)
    end
  end
end
