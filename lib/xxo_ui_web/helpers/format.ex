defmodule XxoUiWeb.Helpers do
  @moduledoc """
  Utility functions used thoughout the code
  """

  def format_name(string) do
    string
    |> String.split(~r{/})
    |> extract_name()
    |> String.capitalize()
  end

  ### Private ###
  defp extract_name([_head | tail]) when length(tail) > 1 do
    extract_name(tail)
  end

  defp extract_name([_head | tail]) when length(tail) == 1 do
    tail
    |> List.first()
    |> String.split(".")
    |> List.first()
  end
end
