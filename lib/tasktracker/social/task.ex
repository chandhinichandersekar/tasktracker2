defmodule Tasktracker.Social.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Social.Task


  schema "tasks" do
    field :assigned, :string
    field :body, :string
    field :completed, :boolean, default: false
    field :time, :integer
    field :title, :string
    #field :user_id, :id
    belongs_to :user, Tasktracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :body, :assigned, :time, :completed, :user_id])
    |> validate_required([:title, :body, :assigned, :time, :completed, :user_id])
  end
end
