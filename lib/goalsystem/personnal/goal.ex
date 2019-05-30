defmodule Goalsystem.Personnal.Goal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "goals" do
    field :completed, :boolean, default: false
    field :name, :string
    field :selected, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(goal, attrs) do
    goal
    |> cast(attrs, [:name, :completed, :selected])
    |> validate_required([:name, :completed, :selected])
  end
end
