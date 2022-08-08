defmodule CounterWeb.CounterLive do
  use Phoenix.LiveView

  def mount(_session, socket) do
    socket = assign(socket, :counter, 0)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Count: <%= @count %></h1>
    <button>+</button>
    <button>-</button>
    """
  end
end
