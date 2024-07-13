# lib/pos_app_web/controllers/session_controller.ex
defmodule PosAppWeb.SessionController do
  use PosAppWeb, :controller

  alias PosApp.Accounts
  alias PosApp.Guardian

  def create(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        {:ok, token, _claims} = Guardian.encode_and_sign(user)
        json(conn, %{token: token})
      _ ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid email or password"})
    end
  end
end
