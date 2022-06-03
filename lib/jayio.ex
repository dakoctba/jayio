defmodule Jayio do
  @moduledoc """
  Jayio keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Jayio.{Repo, Task}

  def create_task(attrs) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  def update_task(task, attrs) do
    {:ok, t} =
      task
      |> Task.changeset(attrs)
      |> Repo.update()

    IO.puts(t.title)

    JayioWeb.Endpoint.broadcast("tasks:lobby", "update_task", %{
      message: "Task #{t.id} atualizada com sucesso: #{t.title}"
    })
  end
end
