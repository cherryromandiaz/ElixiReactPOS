defmodule PosApp.Repo.Migrations.CreateTimeEntries do
  use Ecto.Migration

  def change do
    create table(:time_entries) do
      add :employee_name, :string
      add :start_time, :string
      add :end_time, :string

      timestamps()
    end
  end
end