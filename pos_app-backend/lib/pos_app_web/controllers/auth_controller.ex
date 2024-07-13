# lib/pos_app_web/controllers/auth_controller.ex
defmodule PosAppWeb.AuthController do
  use PosAppWeb, :controller

  alias PosApp.Accounts

  def register(conn, %{"user" => user_params}) do
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

  def login(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, token} ->
        conn
        |> put_status(:ok)
        |> json(%{token: token})
      :error ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid credentials"})
    end
  end
end
