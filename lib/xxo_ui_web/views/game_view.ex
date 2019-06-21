defmodule XxoUiWeb.GameView do
  use XxoUiWeb, :view

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
      "x" -> "/images/x-symbol.png"
      _ -> " "
    end
  end
end
