defmodule XxoUiWeb.GameView do
  use XxoUiWeb, :view

  def get_image(character) do
    case character do
      "aaargh" -> "/images/characters/aaargh.svg"
      "abby" -> "/images/characters/abby.svg"
      "billy" -> "/images/characters/billy.png"
      "casper" -> "/images/characters/casper.svg"
      "octopus" -> "/images/characters/octopus.png"
      "tongue" -> "/images/characters/tongue.png"
      "robert" -> "/images/characters/robert.svg"
      "stanley" -> "/images/characters/stanley.svg"
      "x" -> "/images/characters/godzilla.png"
      _ -> " "
    end
  end
end
