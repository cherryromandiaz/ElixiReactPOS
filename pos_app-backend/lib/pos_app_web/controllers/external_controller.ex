defmodule PosAppWeb.ExternalController do
  use PosAppWeb, :controller

  # Handle all other routes not handled by Phoenix
  def handle_react_routes(conn, _params) do
    conn
    |> put_status(:not_found)
    |> json(%{error: "Route handled by React frontend"})
  end
end
