defmodule GameServer do
  use GenServer

  defmodule State do
    defstruct [:game, :generate_next]
  end

  def start_link({game, generate_next}) do
    GenServer.start_link(__MODULE__, %State{game: game, generate_next: generate_next})
  end

  @impl true
  def init(state) do
    schedule_tick()
    {:ok, state}
  end

  @tick_period_in_ms 500
  defp schedule_tick do
    Process.send_after(self(), :tick, @tick_period_in_ms)
  end

  @impl true
  def handle_info(:tick, %State{game: game, generate_next: generate_next} = state) do
    GameRenderer.render(game)
    new_generation = generate_next.(game)

    schedule_tick()
    {:noreply, %{state | game: new_generation}}
  end
end
