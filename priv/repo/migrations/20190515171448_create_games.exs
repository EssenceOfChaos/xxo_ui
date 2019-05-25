defmodule XxoUi.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :in_progress, :boolean, default: false, null: false
      add :winner, :string

      timestamps()
    end

  end
end
