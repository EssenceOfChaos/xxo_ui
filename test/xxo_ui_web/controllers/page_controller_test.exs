defmodule XxoUiWeb.PageControllerTest do
  use XxoUiWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to xxo!"
  end
end
