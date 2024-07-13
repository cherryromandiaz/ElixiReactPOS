defmodule PosAppWeb.AuthErrorHandler do
  use Plug.ErrorHandler

  def render("401.json", _assigns) do
    %{error: "Unauthorized"}
    |> Plug.Conn.send_resp(401, Poison.encode!(&1))
  end
end
