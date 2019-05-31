defmodule XxoUiWeb.GameView do
  use XxoUiWeb, :view

  def format_name(string) do
    String.split(string, ~r{/})
  end
end
