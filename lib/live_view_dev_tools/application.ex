defmodule LiveViewDevTools.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      # MyAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveViewDevTools.PubSub},
      LiveViewDevTools.Tracker

      # Start the Endpoint (http/https)
      #  MyAppWeb.Endpoint
      # Start a worker by calling: MyApp.Worker.start_link(arg)
      # {MyApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveViewDevTools.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
