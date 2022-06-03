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
    |> broadcast()
  end

  def update_task(task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
    |> broadcast()
  end

  @doc """
  Send the updated task to listeners
  """
  def broadcast({:ok, %Task{id: id, title: title}}) do
    JayioWeb.Endpoint.broadcast("tasks:id_1", "update_task", %{
      message: "Task #{id} inserida ou atualizada com sucesso: #{title}"
    })
  end
end
