defmodule Aoc2 do
  defp input(test) do
    Helper.file_to_numbers(Helper.file(2, test))
  end

  def part1(test \\ false) do
    for [head | tail] <- input(test), reduce: 0 do
      acc ->
        acc +
          if check(tail, head, head < hd(tail)) do
            1
          else
            0
          end
    end
  end

  def part2(test \\ false) do
    for levels <- input(test), reduce: 0 do
      acc ->
        acc +
          Enum.count_until(
            0..length(levels),
            fn i ->
              [head | tail] = List.delete_at(levels, i)
              check(tail, head, head < hd(tail))
            end,
            1
          )
    end
  end

  defp check(tail, head, incr) do
    Enum.reduce_while(tail, head, fn next, prev ->
      dif = next - prev

      if (incr and dif in 1..3) or (!incr and dif in -3..-1) do
        {:cont, next}
      else
        {:halt, :fail}
      end
    end) != :fail
  end
end
