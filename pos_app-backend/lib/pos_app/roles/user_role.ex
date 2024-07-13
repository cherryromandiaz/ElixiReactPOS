defmodule PosApp.Roles.UserRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_roles" do

    field :user_id, :id
    field :role_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_role, attrs) do
    user_role
    |> cast(attrs, [])
    |> validate_required([])
  end
end
