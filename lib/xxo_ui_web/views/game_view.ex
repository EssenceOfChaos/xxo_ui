defmodule XxoUiWeb.GameView do
  use XxoUiWeb, :view

  def get_image(character) do
    case character do
      "aaargh" -> "/images/characters/aaargh.svg"
      "abby" -> "/images/characters/abby.png"
      "frank" -> "/images/characters/frank.png"
      "casper" -> "/images/characters/casper.svg"
      "octopus" -> "/images/characters/octopus.png"
      "monster-tree" -> "/images/characters/monster-tree.png"
      "happy-ghost" -> "/images/characters/happy-ghost.png"
      "stanley" -> "/images/characters/stanley.svg"
      "x" -> "/images/characters/godzilla.png"
      _ -> " "
    end
  end
end
