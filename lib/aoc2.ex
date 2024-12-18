defmodule Aoc2 do
  defp input() do
    Helper.file_to_numbers(2)
  end

  defp reorder() do
    input()
    |> Enum.map(fn levels ->
      {_, r} =
        Enum.reduce(levels, fn l, acc ->
          case acc do
            {last, acc} -> {l, acc + last - l}
            last -> {l, last - l}
          end
        end)

      if r > 0 do
        Enum.reverse(levels)
      else
        levels
      end
    end)
  end

  def part1() do
    reorder()
    |> Enum.count(fn levels ->
      Enum.zip_reduce(levels, tl(levels), true, fn l1, l2, acc ->
        if acc and (l2 - l1) in 1..3, do: true, else: false
      end)
    end)
  end

  def part2() do
    reorder()
    |> Enum.count(fn levels ->
      Enum.zip(levels, tl(levels))
      |> Enum.with_index()
      |> Enum.reduce([], fn {{l1, l2}, i}, bad ->
        if (l2 - l1) in 1..3, do: bad, else: [i | bad]
      end)
      |> Enum.count() < 2
    end)
  end
end
