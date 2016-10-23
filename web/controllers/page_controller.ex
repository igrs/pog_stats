defmodule PogStats.PageController do
  use PogStats.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
