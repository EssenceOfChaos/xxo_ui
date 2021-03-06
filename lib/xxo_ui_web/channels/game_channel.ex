defmodule XxoUiWeb.GameChannel do
  @moduledoc """
  The Game channel
  """
  use XxoUiWeb, :channel
  require Logger

  def join("game:" <> user_character, _params, socket) do
    send(self(), {:after_join, user_character})

    socket = assign(socket, :action_on, user_character)

    {:ok, socket}
  end

  def handle_in("new_move", %{"user" => user, "move" => move}, socket) do
    case Xxo.GameServer.player_move(user, user, convert_id_to_coordinates(move)) do
      {:ok, _} -> pass_action(user, "x")
      {:game_over, _} -> socket = assign(socket, :game_over, true)
    end

    broadcast!(socket, "new_move", %{"user" => user, "move" => move})
    {:noreply, socket}
  end

  def handle_info({:after_join, _user_char}, socket) do
    # game = Xxo.new_game(user_char)
    # socket = assign(socket, :game_state, game.board)
    {:noreply, socket}
  end

  ## Private Functions ##
  defp pass_action(user, symbol) do
    Xxo.GameServer.computer_move(user, symbol)
  end

  # TODO: reduce cyclomatic complexity of convert_id_to_coordinates
  defp convert_id_to_coordinates(id) do
    case id do
      "top-left" -> {0, 0}
      "top-mid" -> {0, 1}
      "top-right" -> {0, 2}
      "mid-left" -> {1, 0}
      "mid-mid" -> {1, 1}
      "mid-right" -> {1, 2}
      "down-left" -> {2, 0}
      "down-mid" -> {2, 1}
      "down-right" -> {2, 2}
    end
  end
end
