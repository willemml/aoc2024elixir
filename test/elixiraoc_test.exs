defmodule ElixiraocTest do
  use ExUnit.Case

  for {{day, part}, answer} <- [
        {{1, 1}, 2_031_679},
        {{1, 2}, 19_678_534},
        {{2, 1}, 606},
        {{2, 2}, 644}
      ] do
    {fun, _} = Code.eval_string("&Aoc#{day}.part#{part}/0")

    test "Day #{day} part #{part}" do
      assert unquote(fun).() == unquote(answer)
    end
  end
end
