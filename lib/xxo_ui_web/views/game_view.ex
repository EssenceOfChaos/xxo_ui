defmodule XxoUiWeb.GameView do
  use XxoUiWeb, :view

  # name comes in as "/images/characters/aaargh.svg"
  # goal is to extract out the "aaargh" part

  #   def format_name(string) do
  #     string
  #     |> String.split(~r{/})
  #     |> extract_name()
  #     |> String.capitalize()
  #   end

  #   ### Private ###
  #   defp extract_name([_head | tail]) when length(tail) > 1 do
  #     extract_name(tail)
  #   end

  #   defp extract_name([_head | tail]) when length(tail) == 1 do
  #     tail
  #     |> List.first()
  #     |> String.split(".")
  #     |> List.first()
  #   end

  def get_image(character) do
    case character do
      "aaargh" -> "/images/characters/aaargh.svg"
      "abby" -> "/images/characters/abby.svg"
      "billy" -> "/images/characters/billy.svg"
      "casper" -> "/images/characters/casper.svg"
      "oscar" -> "/images/characters/oscar.svg"
      "pika" -> "/images/characters/pika.svg"
      "robert" -> "/images/characters/robert.svg"
      "stanley" -> "/images/characters/stanley.svg"
    end
  end
end
