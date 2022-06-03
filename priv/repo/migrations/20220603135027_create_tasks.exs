defmodule Jayio.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :description, :text
      add :personal, :boolean, default: false, null: false
      add :status, :string, null: false

      timestamps()
    end
  end
end
