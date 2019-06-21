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
    Xxo.GameServer.player_move(user, user, convert_id_to_coordinates(move))

    broadcast!(socket, "new_move", %{"user" => user, "move" => move})
    Xxo.GameServer.computer_move(user, "x")

    {:noreply, socket}
  end

  def handle_info({:after_join, user_char}, socket) do
    state = Xxo.GameServer.get_state(user_char)
    socket = assign(socket, :state, state)
    Logger.debug(socket)
    {:noreply, socket}
  end

  ## Private Functions ##

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
