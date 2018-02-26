defmodule Tasktracker.Social.Timeblock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Social.Timeblock


  schema "timeblocks" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    #field :timeblock_id, :id
    belongs_to :task, Tasktracker.Social.Task, foreign_key: :timeblock_id

    timestamps()
  end

  @doc false
  def changeset(%Timeblock{} = timeblock, attrs) do
    timeblock
    |> cast(attrs, [:start, :end, :timeblock_id])
    |> validate_required([:start, :end, :timeblock_id])
  end
end
