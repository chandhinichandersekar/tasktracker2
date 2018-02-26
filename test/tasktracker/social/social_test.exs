defmodule Tasktracker.SocialTest do
  use Tasktracker.DataCase

  alias Tasktracker.Social

  describe "tasks" do
    alias Tasktracker.Social.Task

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Social.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Social.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Social.create_task(@valid_attrs)
      assert task.body == "some body"
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Social.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.body == "some updated body"
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_task(task, @invalid_attrs)
      assert task == Social.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Social.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Social.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Social.change_task(task)
    end
  end

  describe "tasks" do
    alias Tasktracker.Social.Task

    @valid_attrs %{assigned: "some assigned", body: "some body", completed: true, time: 42, title: "some title"}
    @update_attrs %{assigned: "some updated assigned", body: "some updated body", completed: false, time: 43, title: "some updated title"}
    @invalid_attrs %{assigned: nil, body: nil, completed: nil, time: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Social.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Social.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Social.create_task(@valid_attrs)
      assert task.assigned == "some assigned"
      assert task.body == "some body"
      assert task.completed == true
      assert task.time == 42
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Social.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.assigned == "some updated assigned"
      assert task.body == "some updated body"
      assert task.completed == false
      assert task.time == 43
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_task(task, @invalid_attrs)
      assert task == Social.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Social.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Social.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Social.change_task(task)
    end
  end

  describe "timeblocks" do
    alias Tasktracker.Social.Timeblock

    @valid_attrs %{end: ~N[2010-04-17 14:00:00.000000], start: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{end: ~N[2011-05-18 15:01:01.000000], start: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{end: nil, start: nil}

    def timeblock_fixture(attrs \\ %{}) do
      {:ok, timeblock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_timeblock()

      timeblock
    end

    test "list_timeblocks/0 returns all timeblocks" do
      timeblock = timeblock_fixture()
      assert Social.list_timeblocks() == [timeblock]
    end

    test "get_timeblock!/1 returns the timeblock with given id" do
      timeblock = timeblock_fixture()
      assert Social.get_timeblock!(timeblock.id) == timeblock
    end

    test "create_timeblock/1 with valid data creates a timeblock" do
      assert {:ok, %Timeblock{} = timeblock} = Social.create_timeblock(@valid_attrs)
      assert timeblock.end == ~N[2010-04-17 14:00:00.000000]
      assert timeblock.start == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_timeblock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_timeblock(@invalid_attrs)
    end

    test "update_timeblock/2 with valid data updates the timeblock" do
      timeblock = timeblock_fixture()
      assert {:ok, timeblock} = Social.update_timeblock(timeblock, @update_attrs)
      assert %Timeblock{} = timeblock
      assert timeblock.end == ~N[2011-05-18 15:01:01.000000]
      assert timeblock.start == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_timeblock/2 with invalid data returns error changeset" do
      timeblock = timeblock_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_timeblock(timeblock, @invalid_attrs)
      assert timeblock == Social.get_timeblock!(timeblock.id)
    end

    test "delete_timeblock/1 deletes the timeblock" do
      timeblock = timeblock_fixture()
      assert {:ok, %Timeblock{}} = Social.delete_timeblock(timeblock)
      assert_raise Ecto.NoResultsError, fn -> Social.get_timeblock!(timeblock.id) end
    end

    test "change_timeblock/1 returns a timeblock changeset" do
      timeblock = timeblock_fixture()
      assert %Ecto.Changeset{} = Social.change_timeblock(timeblock)
    end
  end
end
