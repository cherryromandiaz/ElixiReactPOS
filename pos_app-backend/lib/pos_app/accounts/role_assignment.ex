defmodule PosApp.Accounts.RoleAssignment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "role_assignments" do
    belongs_to :user, PosApp.Accounts.User
    belongs_to :role, PosApp.Accounts.Role

    timestamps()
  end

  @doc false
  def changeset(role_assignment, attrs) do
    role_assignment
    |> cast(attrs, [:user_id, :role_id])
    |> validate_required([:user_id, :role_id])
    |> unique_constraint([:user_id, :role_id])
  end
end
