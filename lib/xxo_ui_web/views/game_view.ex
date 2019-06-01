defmodule XxoUiWeb.GameView do
  use XxoUiWeb, :view

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

# take_prefix = fn full, prefix ->
#     base = byte_size(prefix)
#     binary_part(full, base, byte_size(full) - base)
#   end
#   take_prefix.("Mr. John", "Mr. ")
#   "John"
