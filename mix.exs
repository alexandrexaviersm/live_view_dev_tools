defmodule LiveViewDevTools.MixProject do
  use Mix.Project

  def project do
    [
      app: :live_view_dev_tools,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {LiveViewDevTools.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_live_dashboard, "~> 0.7.2"},
      {:phoenix_live_view, "~> 0.18.11"},
      {:tailwind, "~> 0.1.9", runtime: Mix.env() == :dev},
      {:heroicons, "~> 0.5.0"}
    ]
  end

  defp aliases do
    ["assets.deploy": ["tailwind default --minify"]]
  end
end
