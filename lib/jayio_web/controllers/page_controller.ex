defmodule JayioWeb.PageController do
  use JayioWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
