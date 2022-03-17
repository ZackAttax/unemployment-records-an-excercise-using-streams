defmodule UnemploymentRecordsWeb.PageController do
  use UnemploymentRecordsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
