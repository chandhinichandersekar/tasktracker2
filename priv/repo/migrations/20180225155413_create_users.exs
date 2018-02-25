defmodule Tasktracker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :mamanager_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:mamanager_id])
  end
end
