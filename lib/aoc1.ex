defmodule Aoc1 do
  defp input() do
    Helper.file_to_numbers(1)
    |> Stream.map(&List.to_tuple/1)
    |> Enum.unzip()
  end

  def part1() do
    input()
    |> Tuple.to_list()
    |> Enum.map(&Enum.sort/1)
    |> Enum.zip_reduce(0, fn [l1, l2], acc -> acc + abs(l1 - l2) end)
  end

  def part2() do
    {a, b} = input()
    f = Enum.frequencies(b)
    Enum.reduce(a, 0, fn n, acc -> acc + n * (f[n] || 0) end)
  end
end
