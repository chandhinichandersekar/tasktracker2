defmodule Tasktracker.Social.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Social.Task


  schema "tasks" do
    field :body, :string
    field :title, :string
    belongs_to :user, Tasktracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end
