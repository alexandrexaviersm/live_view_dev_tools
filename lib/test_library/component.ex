defmodule LiveViewDevTools.Component do
  use Phoenix.LiveComponent
  use Phoenix.HTML

  import LiveViewDevTools.CoreComponents

  def update(assigns, socket) do
    socket = assign(socket, assigns)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div id="tracker-dashboard">
        <style>
          <%= raw(@css) %>
        </style>

        <div>
          <.button>
          Infos
          </.button>

          <.button>
          Events
          </.button>

          <.button>
          Assigns
          </.button>
        </div>
      </div>
    """
  end

  def handle_event("inc", _, socket) do
    send(self(), :msg)

    socket = update(socket, :count, &(&1 + 1))

    {:noreply, socket}
  end
end
