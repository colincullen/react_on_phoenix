defmodule ReactOnPhoenixWeb.PageController do
  use ReactOnPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
