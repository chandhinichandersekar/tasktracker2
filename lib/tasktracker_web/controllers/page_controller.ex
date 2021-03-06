#References for this file
#https://elixirschool.com/en/lessons/basics/enum/
#https://hexdocs.pm/elixir/Enum.html
#http://elixir-recipes.github.io/collections/filtering-collections/
#https://elixir-lang.org/getting-started/enumerables-and-streams.html

defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def issues(conn, _params) do
  tasks = Tasktracker.Social.list_tasks()
          |> Enum.map(&{&1.user_id})
  taskUserList = for  x <- tasks do Tuple.to_list(x) end
  taskUserId = List.flatten(taskUserList)
  users = Tasktracker.Accounts.list_users()
             |> Enum.map(&{&1.name, &1.mamanager_id, &1.id})
  currentUserId = conn.assigns[:current_user].id
  managedUsers = Enum.filter(users, fn(x) -> elem(x, 1) == currentUserId end)
  managedUsersId = managedUsers |> Enum.map(&{elem(&1, 2)})
  listManagedUserId = for  x <- managedUsersId do Tuple.to_list(x) end
  listManagedUserId = List.flatten(listManagedUserId)
  tempIdList = taskUserId -- listManagedUserId
  newIdList = taskUserId -- tempIdList
  managedTasks = Tasktracker.Social.list_tasks()
                 |> Enum.filter(&(Enum.member?(newIdList, &1.user_id)))
  managedTasks = Enum.reverse(managedTasks)
  currentUserTask = Tasktracker.Social.list_tasks()
                    |> Enum.filter(&(currentUserId == &1.user_id))
  changeset = Tasktracker.Social.change_task(%Tasktracker.Social.Task{user_id: conn.assigns[:current_user].id})
  render conn, "issues.html", managedTasks: managedTasks, changeset: changeset, currentUserTask: currentUserTask
  end

  def taskreport(conn, _params) do
    tasks = Tasktracker.Social.list_tasks()
            |> Enum.map(&{&1.user_id})
    taskUserList = for  x <- tasks do Tuple.to_list(x) end
    taskUserId = List.flatten(taskUserList)

    users = Tasktracker.Accounts.list_users()
               |> Enum.map(&{&1.name, &1.mamanager_id, &1.id})
    currentUserId = conn.assigns[:current_user].id
    managedUsers = Enum.filter(users, fn(x) -> elem(x, 1) == currentUserId end)
    managedUsersId = managedUsers |> Enum.map(&{elem(&1, 2)})
    listManagedUserId = for  x <- managedUsersId do Tuple.to_list(x) end
    listManagedUserId = List.flatten(listManagedUserId)
    tempIdList = taskUserId -- listManagedUserId
    newIdList = taskUserId -- tempIdList
    managedTasks = Tasktracker.Social.list_tasks()
                   |> Enum.filter(&(Enum.member?(newIdList, &1.user_id)))
    changeset = Tasktracker.Social.change_task(%Tasktracker.Social.Task{user_id: conn.assigns[:current_user].id})
    render conn, "taskreport.html", managedTasks: managedTasks, changeset: changeset
  end
end
