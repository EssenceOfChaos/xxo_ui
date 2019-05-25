defmodule XxoUi.GamePlay.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :in_progress, :boolean, default: true
    field :winner, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:in_progress])
    |> validate_required([:in_progress])
  end
end
