# lib/pos_app_web/plugs/authenticate.ex
defmodule PosAppWeb.Plugs.Authenticate do
  import Plug.Conn
  import Guardian.Plug

  def init(default), do: default

  def call(conn, _default) do
    case Guardian.Plug.auth(conn) do
      {:ok, claims} ->
        user_id = claims["sub"]
        case PosApp.Accounts.get_user(user_id) do
          {:ok, user} ->
            assign(conn, :current_user, user)
          _ ->
            unauthorized(conn)
        end
      {:error, _reason} ->
        unauthorized(conn)
    end
  end

  defp unauthorized(conn) do
    conn
    |> put_status(:unauthorized)
    |> json(%{error: "Unauthorized"})
    |> halt()
  end
end
