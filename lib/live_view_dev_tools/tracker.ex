defmodule LiveViewDevTools.Tracker do
  use GenServer

  alias LiveViewDevTools.PubSub

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: :live_view_dev_tools_tracker)
  end

  def init(_init_arg) do
    Phoenix.PubSub.subscribe(PubSub, "start")
    Phoenix.PubSub.subscribe(PubSub, "event")

    {:ok, []}
  end

  def handle_info({:pid, %{pid: pid, name: name}}, state) do
    IO.inspect("PID RECEIVED: #{inspect(pid)} - LV NAME: #{name}")

    {:noreply, state}
  end

  def handle_info({:event, %{name: name, pid: pid, params: params}}, state) do
    IO.inspect(
      "EVENT RECEIVED: #{inspect(name)} - LV PID: #{inspect(pid)} - PARAMS: #{inspect(params)}"
    )

    {:noreply, state}
  end
end
