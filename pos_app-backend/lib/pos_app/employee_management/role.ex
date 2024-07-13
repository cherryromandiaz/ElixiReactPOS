# lib/pos_app/employee_management/role.ex
defmodule PosApp.EmployeeManagement.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :name, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(role, params \\ %{}) do
    role
    |> cast(params, [:name, :description])
    |> validate_required([:name])
  end

  def list_roles() do
    Repo.all(Role)
  end

  def get_role!(id) do
    Repo.get!(Role, id)
  end

  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  def update_role(id, attrs \\ %{}) do
    role = get_role!(id)
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  def delete_role!(id) do
    role = get_role!(id)
    Repo.delete!(role)
  end
end
