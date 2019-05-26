defmodule XxoUi.Factory do
  @moduledoc """
  Define model factories
  """
  use ExMachina.Ecto, repo: XxoUi.Repo
  alias XxoUi.GamePlay.Game

  def game_factory do
    %Game{in_progress: true, winner: "Johan Johnson"}
  end
end
