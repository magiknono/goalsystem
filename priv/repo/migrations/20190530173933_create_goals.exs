defmodule Goalsystem.Repo.Migrations.CreateGoals do
  use Ecto.Migration

  def change do
    create table(:goals) do
      add :name, :string
      add :completed, :boolean, default: false, null: false
      add :selected, :boolean, default: false, null: false

      timestamps()
    end

  end
end
