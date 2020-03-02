defmodule GameRenderer do
  def render(game) do
    game
    |> grid()
    |> IO.write()
  end

  defp grid(%{size: size, alive_cells: alive_cells}) do
    lines =
      0..(size - 1)
      |> Enum.map(fn y -> line(y, size, alive_cells) end)
      |> Enum.join("\n")

    IO.ANSI.reset() <> IO.ANSI.clear() <> IO.ANSI.home() <> lines
  end

  defp line(line, size, alive_cells) do
    0..(size - 1)
    |> Enum.map(fn x -> if {x, line} in alive_cells, do: "🐕", else: "🌲" end)
    |> Enum.join()
  end
end
