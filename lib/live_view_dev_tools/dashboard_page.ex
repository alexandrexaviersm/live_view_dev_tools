defmodule LiveViewDevTools.DashboardPage do
  @moduledoc false
  use Phoenix.LiveDashboard.PageBuilder
  alias Phoenix.LiveDashboard.PageBuilder

  @impl PageBuilder
  def mount(_params, _session, socket) do
    content = File.read!("#{:code.priv_dir(:live_view_dev_tools)}/static/assets/app.css")

    socket = assign(socket, count: 0, css: content)

    {:ok, socket}
  end

  @impl PageBuilder
  def menu_link(_, _) do
    {:ok, "LiveView Dev Tools"}
  end

  @impl PageBuilder
  def render_page(%{page: %{node: node}, count: count, css: content}) do
    {LiveViewDevTools.Component,
     %{id: :live_view_dev_tools_component, node: node, count: count, css: content}}
  end

  @impl PageBuilder
  def handle_info(:msg, socket) do
    IO.inspect("Received!!")

    socket = update(socket, :count, &(&1 + 1))

    {:noreply, socket}
  end
end
