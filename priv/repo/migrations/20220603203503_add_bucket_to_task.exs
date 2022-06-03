defmodule Jayio.Repo.Migrations.AddBucketToTask do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :bucket, :string
    end

    create index(:tasks, [:bucket])
  end
end
