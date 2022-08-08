defmodule CounterWeb.CounterLive do
  use CounterWeb, :live_view

  def render(assigns) do
    ~L"""
    <h1>Count: <%= @count %></h1>
    <button>+</button>
    <button>-</button>
    """
  end

  def mount(_params, _other, socket) do
    socket = assign(socket, :count, 0)
    {:ok, socket}
  end
end
