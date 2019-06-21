defmodule XxoUiWeb.GameController do
  use XxoUiWeb, :controller

  alias XxoUi.GamePlay
  # alias XxoUi.GamePlay.Game

  def index(conn, _params) do
    games = GamePlay.list_games()
    render(conn, "index.html", games: games)
  end

  def new(conn, %{"char" => char}) do
    Xxo.new_game(char)
    state = Xxo.GameServer.get_state(char)
    board = state.board

    conn
    |> assign(:game_board, board)
    |> render("new.html", game_board: board, char: char)
  end

  def create(conn, %{"game" => game_params}) do
    case GamePlay.create_game(game_params) do
      {:ok, game} ->
        conn
        |> put_flash(:info, "Game created successfully.")
        |> redirect(to: Routes.game_path(conn, :show, game))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    game = GamePlay.get_game!(id)
    render(conn, "show.html", game: game)
  end

  def edit(conn, %{"id" => id}) do
    game = GamePlay.get_game!(id)
    changeset = GamePlay.change_game(game)
    render(conn, "edit.html", game: game, changeset: changeset)
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = GamePlay.get_game!(id)

    case GamePlay.update_game(game, game_params) do
      {:ok, game} ->
        conn
        |> put_flash(:info, "Game updated successfully.")
        |> redirect(to: Routes.game_path(conn, :show, game))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", game: game, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    game = GamePlay.get_game!(id)
    {:ok, _game} = GamePlay.delete_game(game)

    conn
    |> put_flash(:info, "Game deleted successfully.")
    |> redirect(to: Routes.game_path(conn, :index))
  end
end
