defmodule LiveViewDevTools.DevToolsHook do
  alias LiveViewDevTools.PubSub

  def on_mount(:default, _params, _session, socket) do
    if Phoenix.LiveView.connected?(socket) do
      Phoenix.PubSub.broadcast(PubSub, "start", {:pid, %{pid: self(), name: socket.view}})
    end

    socket =
      Phoenix.LiveView.attach_hook(socket, :my_hook, :handle_event, fn
        event, params, socket ->
          Phoenix.PubSub.broadcast(
            PubSub,
            "event",
            {:event, %{name: event, pid: self(), params: params}}
          )

          {:cont, socket}
      end)

    socket =
      Phoenix.Component.assign(socket,
        key: "world"
      )

    {:cont, socket}
  end
end
