defmodule GameRenderer do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  def render(%{size: _size, alive_cells: _alive_cells} = game) do
    GenServer.cast(__MODULE__, {:render_game, game})
  end

  @impl true
  def handle_cast({:render_game, game}, state) do
    do_render(game)
    {:noreply, state}
  end

  defp do_render(game) do
    grid = IO.ANSI.reset() <> IO.ANSI.clear() <> IO.ANSI.home() <> grid(game)
    IO.write(grid)
  end

  defp grid(%{size: size, alive_cells: alive_cells}) do
    0..(size - 1)
    |> Enum.map(fn y -> line(y, size, alive_cells) end)
    |> Enum.join("\n")
  end

  defp line(line, size, alive_cells) do
    0..(size - 1)
    |> Enum.map(fn x -> if {x, line} in alive_cells, do: "🐕", else: "🌲" end)
    |> Enum.join()
  end
end
