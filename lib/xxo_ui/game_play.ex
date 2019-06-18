defmodule XxoUi.GamePlay do
  @moduledoc """
  The GamePlay context.
  """

  import Ecto.Query, warn: false
  alias XxoUi.Repo

  alias XxoUi.GamePlay.Game

  def game_status(game_name) do
    Xxo.GameServer.get_state(game_name)
  end

  def list_games do
    Repo.all(Game)
  end

  def get_game!(id), do: Repo.get!(Game, id)

  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  def change_game(%Game{} = game) do
    Game.changeset(game, %{})
  end
end
