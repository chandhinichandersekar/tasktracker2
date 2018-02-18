defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def issues(conn, _params) do
  tasks = Tasktracker.Social.list_tasks()
  users = Tasktracker.Accounts.list_users()
  changeset = Tasktracker.Social.change_task(%Tasktracker.Social.Task{user_id: conn.assigns[:current_user].id})
  render conn, "issues.html", tasks: tasks, changeset: changeset, users: users
end

end