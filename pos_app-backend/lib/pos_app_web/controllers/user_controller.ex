# lib/pos_app_web/controllers/user_controller.ex
defmodule PosAppWeb.UserController do
  use PosAppWeb, :controller

  alias PosApp.Accounts
  alias PosApp.Accounts.User

  def index(conn, _params) do
    users = Accounts.list_users()
    json(conn, %{users: users})
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    json(conn, %{user: user})
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> json(%{user: user})
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset.errors})
    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %Accounts.User{} = user} <- Accounts.update_user(user, user_params) do
      json(conn, %{user: user})
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    Accounts.delete_user(user)
    send_resp(conn, :no_content, "")
  end
end
