# lib/pos_app/employee_management/time_entry.ex
defmodule PosApp.EmployeeManagement.TimeEntry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "time_entries" do
    field :employee_name, :string
    field :start_time, :string
    field :end_time, :string

    timestamps()
  end

  @doc false
  def changeset(time_entry, params \\ %{}) do
    time_entry
    |> cast(params, [:employee_name, :start_time, :end_time])
    |> validate_required([:employee_name, :start_time, :end_time])
  end

  def list_time_entries() do
    Repo.all(TimeEntry)
  end

  def get_time_entry!(id) do
    Repo.get!(TimeEntry, id)
  end

  def create_time_entry(attrs \\ %{}) do
    %TimeEntry{}
    |> TimeEntry.changeset(attrs)
    |> Repo.insert()
  end

  def update_time_entry(id, attrs \\ %{}) do
    time_entry = get_time_entry!(id)
    time_entry
    |> TimeEntry.changeset(attrs)
    |> Repo.update()
  end

  def delete_time_entry!(id) do
    time_entry = get_time_entry!(id)
    Repo.delete!(time_entry)
  end
end
