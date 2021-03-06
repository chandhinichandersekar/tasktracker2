#References for this file
#https://elixirschool.com/en/lessons/basics/enum/
#https://hexdocs.pm/elixir/Enum.html
#http://elixir-recipes.github.io/collections/filtering-collections/
#https://elixir-lang.org/getting-started/enumerables-and-streams.html

defmodule TasktrackerWeb.TaskController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Social


  def index(conn, _params) do
    tasks = Social.list_tasks()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    currentUserId = conn.assigns[:current_user].id
    changeset = Tasktracker.Social.change_task(%Tasktracker.Social.Task{user_id: currentUserId})
    #learnt the usage of select tag from (https://stackoverflow.com/questions/36698192/how-to-create-a-select-tag-with-options-and-values-from-a-separate-model-in-the)
    #and applied it in task tracker app accordingly
    assigned = Tasktracker.Accounts.list_users()
               |> Enum.map(&{&1.name, &1.mamanager_id, &1.id})
    managedUsers = Enum.filter(assigned, fn(x) -> elem(x, 1) == currentUserId end)
    managedUsers = managedUsers |> Enum.map(&{elem(&1, 0), elem(&1, 2)})
    time = Tasktracker.Social.list_timeblocks()
    render(conn, "new.html", changeset: changeset, managedUsers: managedUsers, time: time)
  end

  def create(conn, %{"task" => task_params}) do
    currentUserId = conn.assigns[:current_user].id
    time = Tasktracker.Social.list_timeblocks()
    assigned = Tasktracker.Accounts.list_users()
               |> Enum.map(&{&1.name, &1.mamanager_id, &1.id})
    managedUsers = Enum.filter(assigned, fn(x) -> elem(x, 1) == currentUserId end)
    managedUsers = managedUsers |> Enum.map(&{elem(&1, 0), elem(&1, 2)})
    case Social.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: "/issues")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, managedUsers: managedUsers, time: time)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Social.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, %{"id" => id}) do
    currentUserId = conn.assigns[:current_user].id
    currentUserName = conn.assigns[:current_user].name
    tupleCurrentUser = [{currentUserName, Integer.to_string(currentUserId)}]
    task = Social.get_task!(id)
    assigned = Tasktracker.Accounts.list_users()
               |> Enum.map(&{&1.name, &1.mamanager_id, &1.id})
    if (task.user_id == currentUserId) do
      managedUsers = tupleCurrentUser
    else
    managedUsers = Enum.filter(assigned, fn(x) -> elem(x, 1) == currentUserId end)
    managedUsers = managedUsers |> Enum.map(&{elem(&1, 0), elem(&1, 2)})
    end
    time = Tasktracker.Social.timeblock_map_for(id)
    changeset = Social.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset, managedUsers: managedUsers, time: time)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    currentUserId = conn.assigns[:current_user].id
    time = Tasktracker.Social.list_timeblocks()
    task = Social.get_task!(id)
    assigned = Tasktracker.Accounts.list_users()
               |> Enum.map(&{&1.name, &1.mamanager_id, &1.id})
    managedUsers = Enum.filter(assigned, fn(x) -> elem(x, 1) == currentUserId end)
    managedUsers = managedUsers |> Enum.map(&{elem(&1, 0), elem(&1, 2)})
    case Social.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: task_path(conn, :show, task))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset, managedUsers: managedUsers, time: time)
    end
  end


  def delete(conn, %{"id" => id}) do
    task = Social.get_task!(id)
    {:ok, _task} = Social.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: task_path(conn, :index))
  end
end
