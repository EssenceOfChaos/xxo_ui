defmodule XxoUiWeb.ErrorViewTest do
  use XxoUiWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(XxoUiWeb.ErrorView, "404.html", []) == "Page not found"
  end

  test "renders 500.html" do
    assert render_to_string(XxoUiWeb.ErrorView, "500.html", []) == "Internal Server Error"
  end
end
