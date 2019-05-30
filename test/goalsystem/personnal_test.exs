defmodule Goalsystem.PersonnalTest do
  use Goalsystem.DataCase

  alias Goalsystem.Personnal

  describe "goals" do
    alias Goalsystem.Personnal.Goal

    @valid_attrs %{completed: true, name: "some name", selected: true}
    @update_attrs %{completed: false, name: "some updated name", selected: false}
    @invalid_attrs %{completed: nil, name: nil, selected: nil}

    def goal_fixture(attrs \\ %{}) do
      {:ok, goal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Personnal.create_goal()

      goal
    end

    test "list_goals/0 returns all goals" do
      goal = goal_fixture()
      assert Personnal.list_goals() == [goal]
    end

    test "get_goal!/1 returns the goal with given id" do
      goal = goal_fixture()
      assert Personnal.get_goal!(goal.id) == goal
    end

    test "create_goal/1 with valid data creates a goal" do
      assert {:ok, %Goal{} = goal} = Personnal.create_goal(@valid_attrs)
      assert goal.completed == true
      assert goal.name == "some name"
      assert goal.selected == true
    end

    test "create_goal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Personnal.create_goal(@invalid_attrs)
    end

    test "update_goal/2 with valid data updates the goal" do
      goal = goal_fixture()
      assert {:ok, %Goal{} = goal} = Personnal.update_goal(goal, @update_attrs)
      assert goal.completed == false
      assert goal.name == "some updated name"
      assert goal.selected == false
    end

    test "update_goal/2 with invalid data returns error changeset" do
      goal = goal_fixture()
      assert {:error, %Ecto.Changeset{}} = Personnal.update_goal(goal, @invalid_attrs)
      assert goal == Personnal.get_goal!(goal.id)
    end

    test "delete_goal/1 deletes the goal" do
      goal = goal_fixture()
      assert {:ok, %Goal{}} = Personnal.delete_goal(goal)
      assert_raise Ecto.NoResultsError, fn -> Personnal.get_goal!(goal.id) end
    end

    test "change_goal/1 returns a goal changeset" do
      goal = goal_fixture()
      assert %Ecto.Changeset{} = Personnal.change_goal(goal)
    end
  end
end
