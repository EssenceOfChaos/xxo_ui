defmodule XxoUiWeb.GameChannel do
  @moduledoc """
  The Game channel
  """
  use XxoUiWeb, :channel

  def join("game:" <> _item_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_move", params, socket) do
    broadcast!(socket, "new_move", params)
    {:noreply, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (game:lobby).
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  #   defp authorized?(_payload) do
  #     true
  #   end
end
