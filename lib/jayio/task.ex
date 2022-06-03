defmodule Jayio.Task do
  @moduledoc """
  Task is responsible to manage user tasks
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :personal, :boolean, default: false
    field :title, :string

    field :status, Ecto.Enum,
      values: [
        :unstarted,
        :completed,
        :started,
        :blocked,
        :pushed,
        :canceled,
        :unstarted_blocked
      ],
      default: :unstarted

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :personal, :status])
    |> validate_required([:title])
  end
end
