defmodule Tasktracker.Repo.Migrations.CreateTimeblocks do
  use Ecto.Migration

  def change do
    create table(:timeblocks) do
      add :start, :naive_datetime
      add :end, :naive_datetime
      add :timeblock_id, references(:tasks, on_delete: :delete_all)

      timestamps()
    end

    create index(:timeblocks, [:timeblock_id])
  end
end
