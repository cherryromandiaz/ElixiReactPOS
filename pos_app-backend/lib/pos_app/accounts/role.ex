defmodule PosApp.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :name, :string

    has_many :role_assignments, PosApp.Accounts.RoleAssignment
    has_many :users, through: [:role_assignments, :user]

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
