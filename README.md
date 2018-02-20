# Tasktracker

### About the app:
  * The task tracker app allows the user to register an user account and login.
  * It allows the user to create new tasks and edit existing tasks.
  * The user can assign tasks to oneself or other users present in the system.
  * The user can track the time for how long one has worked on the task.
  * A task can be marked as completed/in progress depending upon the status of a task.

### Main Components of the app:
  * User resource - user id, email id, name
  * Task resource - user id, task id, title, description, assigned, time, completed

### User Functionalities:
  * Register -
     * A new user of the system can register by clicking on the register link on the index page.
     * This navigates the user to a new user page `tasks1.chandhinichandersekar.com/users/new`.
     * The user can create an account by filling a form that has two fields namely the email id and user name.
     * This version of the app supports users with the same name or email ids, but both of these fields are mandatory for creating an account successfully.
     * An user can edit his profile by clicking on the edit link on the new user page.
     * This navigates the user to the edit user page `tasks1.chandhinichandersekar.com/users/user_id/edit`

  * Login/logout -
     * Once the user has created an account, the user can login by using the email id.
     * A user has to be logged in to create, edit or view the tasks.

  * Task feed -
     * The user upon clicking the login button, gets redirected to the `tasks1.chandhinichandersekar.com/issues` page.
     * This page is the Task feed page, which contains all the tasks created by all the users in the system.
     * Every user can view all the tasks that were created by oneself and the others in the system, on this page.
     * Every user can also edit any of the tasks created by oneself or other users in the system.
     * This page also has links to create a new task, edit tasks and logout.
     * At any point of time the user can come back to the feed page by clicking on the task feed link on the top right of the page.

  * Tasks -
     * A registered user can create and edit tasks.
     * Create - a user can create a new task by clicking on new task link on the top right of the page.
     * This navigates the user to a new task page `tasks1.chandhinichandersekar.com/tasks/new`.
     * A new task has three mandatory fields namely title, description and assigned.
     * Whenever a new task is created it must be created with a title, description and the person to whom the task should be assigned to.
     * Users can assign a task to themselves or to other users in the system.
     * There are two more fields called the time and completed.
     * The time field is used to keep track of the amount of time the user spent on a task and accepts only number input.
     * This tracks time only in increments of 15 minutes.
     * The completed field is a boolean, and is used to indicate if a task is in progress or is completed.
     * Edit - any created task can be edited by any user registered in the system.
     * A task can be edited by clicking on the edit link present in each task on the task feed page.
     * This navigates the user to a edit task page `tasks1.chandhinichandersekar.com/tasks/task_id/edit`.
     * Tasks can be reassigned to another user at any time.
     * This reassignment of tasks can be done by any registered user in the system.
     * Tasks that are completed can be switched back to in progress by any registered user, if one thinks there is more to be done in the task.
     * The title and description of tasks can also be updated by any registered user at anytime.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
