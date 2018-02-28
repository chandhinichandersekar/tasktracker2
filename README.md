# Tasktracker

### Overview
  * The task tracker app allows the users to register an user account and login.
  * It allows the user to create new tasks and edit existing tasks.
  * The user can assign tasks to other users present in the system based on certain criteria.
  * The user can track the time for how long one has worked on the task.
  * A task can be marked as completed/in progress depending upon the status of a task.

### Main Components of the app:
  * Users - Managers and underlings
  * Tasks
  * Time blocks

### User Functionalities:
  * Register -
     * This app has been designed with the following example in mind,
       * There is a big organization and every new employee is registered to the system by any higher official.
       * This official creates an account for every new employee and assigns him a manager.
       * So, the manager of a new user is assigned while registering a user itself.
     * A new user of the system is registered to the system by clicking on the register link on the index page.
     * This navigates the user to a new user page `tasks2.chandhinichandersekar.com/users/new`.
     * A new user account can be created by filling a form that has the following fields:
       * Email - the user has to enter an email-id
       * Name - the user has to enter a name
       * Manager - Any new user is assigned with a manager while creating an account itself
       (The very first user of the system is considered to be the person with the highest authority and hence has no manager)
     * This version of the app supports users with the same name or email ids, but both of these fields are mandatory for creating an account successfully.
     * A successful registration navigates the user back to the Login page.

  * Login/logout -
     * Once the user has been registered with an account, the user can login by using the email id.
     * A user has to be logged in to create, edit or view the tasks.

  * Task feed -
     * The user upon clicking the login button, gets redirected to the `tasks2.chandhinichandersekar.com/issues` page.
     * This page is the Task feed page, which contains the tasks assigned to the current user and the tasks of his underlings.
     * The user can view only the tasks that are assigned to him and his underlings.
     * The user can also edit the tasks that are assigned to him and his underlings.
     * This page also has links to create a new task, edit tasks, create new user, task report, your profile and logout.
     * At any point of time the user can come back to the feed page by clicking on the feed link on the top right of the page.
        * Links on this page:
           * Create new user - this navigates the user to the page `tasks2.chandhinichandersekar.com/users/new`.
           * The current user can register a new user from here.
           * After successful registration, the user is navigated back to the login screen, where the user can either logout and login as the newly created user or as the current user, can navigate back to any of the other pages by clicking on the links on the top right of the page.

           * Task Report - this navigates the user to the page `tasks2.chandhinichandersekar.com/taskreport`
           * This page displays a table which allows the user to see the task report of all his underlings.
           * It contains the Title, Description, status and the person to whom the task is assigned to.

           * Your Profile - this navigates the user to his profile page.
           * This page displays the name, email, manager and underlings of the user.

  * Tasks -
     * A registered user can create and edit tasks.
     * Create - a user can create a new task by clicking on new task link on the top right of the page.
     * This navigates the user to a new task page `tasks1.chandhinichandersekar.com/tasks/new`.
     * A new task has three mandatory fields namely title, description and assigned.
     * Whenever a new task is created it must be created with a title, description and the person to whom the task should be assigned to.
     * If the user does not have any underlings he cannot create any new tasks.
     * Only a user's manager can assign him a task and a user can assign tasks only to his underlings.
     * The completed field is a boolean, and is used to indicate if a task is in progress or is completed.
     * Edit - any created task can be edited by any user registered in the system.
     * A task can be edited by clicking on the edit link present in each task on the task feed page.
     * This navigates the user to a edit task page `tasks1.chandhinichandersekar.com/tasks/task_id/edit`.
     * Tasks can be reassigned to another user at any time.
     * This reassignment of tasks can be done only by the user's manager.
     * Tasks that are completed can be switched back to in progress by the user or the manager of the user, if one thinks there is more to be done in the task.
     * The title and description of tasks can also be updated by the user or the manager of the user at anytime.
     * The updated task appears as the first task on the Task feed page.

  * Time Blocks -
     * This feature is present in the task edit page of every task.
     * This feature allows the user to keep track of the time that one has worked on a particular task.
     * It keeps track of time by generating start and end timestamps, each time the user gives one.
     * There are two ways in which this feature allows the user to track time,
       * Enter Time spent Manually -  the user can enter a start and an end time manually using the date time field.
       * Clicking on save time button will add the newly generated time stamp to the time block table on the same page.
       * Automatic Timer - the user can generate a start/end timestamp by just clicking on the start working and end working buttons.
       * This will automatically generate the respective timestamps and add it to the time blocks table.
     * The generated time blocks can be edited, saved and deleted.
     * Edit time block - the user can edit an already created time block.
     * Clicking on the edit button will display a new section on the page with the label Edit Timestamp along with start and end date time fields.
     * The user can enter a new value here and click on save edited timestamp of the respective time block row to see the updated value of the time   block.
     * Delete - the user can delete an already created time block.
     * Clicking on the delete button of a particular time block deletes it.
     * There is link on the task feec page called, 'Click here to view edit timestamps' which also navigates the user to the edit task page.
     * All the time blocks of any particular task can be seen on the edit task page of that task.

  * Admin pages -
     * This app is designed in such a way that deleting a user or a task is considered as admin only tasks, so the list of all the users page and list of all the tasks page is hidden for a normal user.
     * These pages can be navigated by using `tasks1.chandhinichandersekar.com/users` and `tasks1.chandhinichandersekar.com/tasks`.
     * Deleting a user deletes the tasks created by the user, as the user is no longer part of the system.
     * Deleting a task just removes that task Off the system.

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
