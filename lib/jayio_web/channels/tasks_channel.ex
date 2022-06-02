defmodule JayioWeb.TasksChannel do
  use JayioWeb, :channel

  # JayioWeb.Endpoint.broadcast("tasks:lobby", "update_task", %{show: "de bola"})

  @impl true
  def join("tasks:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (tasks:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "update_task", payload)
    {:noreply, socket}
  end

  @impl true
  def handle_in("subscribe", payload, socket) do
    IO.puts("Massa demais!!!")

    {:reply, {:ok, %{payload: payload, massa: "demais"}}, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
