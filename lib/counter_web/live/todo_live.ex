defmodule CounterWeb.TodoLive do
  use CounterWeb, :live_view

  def render(assigns) do
    ~L"""
      <div>
        <%= Enum.map(get_todos(), fn todo -> render_todo(assigns, todo) end) %>
      </div>
    """
  end

  def render_todo(assigns, todo) do
    id = todo["id"]
    title = todo["title"]

    ~L"""
    <div>
      <h2>ID: <%= id %></h2>
      <p>TITLE: <%= title %></p>
    </div>
    """
  end

  def get_todos() do
    url = "https://jsonplaceholder.typicode.com/todos"
    res = HTTPoison.get!(url)
    Poison.decode!(res.body)
  end

  def mount(_params, _, socket) do
    todos = get_todos()
    socket = assign(socket, :todos, todos)
    {:ok, socket}
  end

end
