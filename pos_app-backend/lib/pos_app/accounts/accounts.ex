defmodule PosApp.Accounts do
  import Ecto.Query, warn: false
  alias PosApp.Repo
  alias PosApp.Accounts.LoyaltyProgram
  alias PosApp.Accounts.User

  # Function to authenticate a user based on email and password
  def authenticate_user(email, password) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, "User not found"}
      user ->
        case comeonin_bcrypt.verify_pass(password, user.password_hash) do
          true -> {:ok, generate_token(user)}
          false -> {:error, "Invalid password"}
        end
    end
  end

  # Function to generate JWT token for a user
  defp generate_token(user) do
    {:ok, token, _} =
      Jose.JWT.encode(
        %{
          user_id: user.id,
          exp: DateTime.utc_now() |> DateTime.add(Duration.from_days(7))
        },
        Application.get_env(:pos_app, :jwt_secret_key),
        "HS256"
      )

    token
  end

  # Function to list all users
  def list_users do
    Repo.all(User)
  end

  # Function to fetch a user by ID
  def get_user!(id) do
    Repo.get!(User, id)
  end

  # Function to create a new user
  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  # Function to update an existing user
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  # Function to delete a user
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end
  
  def list_loyalty_programs do
    Repo.all(LoyaltyProgram)
  end

  def get_loyalty_program!(id) do
    Repo.get!(LoyaltyProgram, id)
  end

  def create_loyalty_program(attrs \\ %{}) do
    %LoyaltyProgram{}
    |> LoyaltyProgram.changeset(attrs)
    |> Repo.insert()
  end

  def update_loyalty_program(%LoyaltyProgram{} = loyalty_program, attrs) do
    loyalty_program
    |> LoyaltyProgram.changeset(attrs)
    |> Repo.update()
  end

  def delete_loyalty_program(%LoyaltyProgram{} = loyalty_program) do
    Repo.delete(loyalty_program)
  end
end