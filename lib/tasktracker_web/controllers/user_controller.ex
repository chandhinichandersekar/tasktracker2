defmodule TasktrackerWeb.UserController do
  use TasktrackerWeb, :controller
  import Ecto.Query
  alias Tasktracker.Accounts
  alias Tasktracker.Accounts.User

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    userList = Tasktracker.Accounts.list_users()
               |> Enum.map(&{&1.name, &1.id})
    render(conn, "new.html", changeset: changeset, userList: userList)
  end

  def create(conn, %{"user" => user_params}) do
    userList = Tasktracker.Accounts.list_users()
               |> Enum.map(&{&1.name, &1.id})
    #user_params.mamanager_id = user_params.id
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, userList: userList)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    manager_id = Map.get(user, :mamanager_id)
    manager = Accounts.get_user!(manager_id)
    managername = Map.get(manager, :name)
    render(conn, "show.html", user: user, managername: managername)
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    userList = Tasktracker.Accounts.list_users()
               |> Enum.map(&{&1.name, &1.id})
    changeset = Accounts.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset, userList: userList)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)
    userList = Tasktracker.Accounts.list_users()
               |> Enum.map(&{&1.name, &1.id})
    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset, userList: userList)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end
end
