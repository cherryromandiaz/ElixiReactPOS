# lib/pos_app/accounts/user.ex
defmodule PosApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :language, :string
    field :theme, :string
    field :notification_preferences, :string

    has_many :role_assignments, PosApp.Accounts.RoleAssignment
    has_many :roles, through: [:role_assignments, :role]

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :language, :theme, :notification_preferences])
    |> validate_required([:name, :email, :password, :language, :theme, :notification_preferences])
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case get_change(changeset, :password) do
      nil -> changeset
      password -> put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
    end
  end
end

