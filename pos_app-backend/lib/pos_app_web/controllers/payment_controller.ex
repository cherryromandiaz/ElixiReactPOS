# lib/pos_app_web/controllers/payment_controller.ex
defmodule PosAppWeb.PaymentController do
  use PosAppWeb, :controller

  alias PosApp.PaymentGateway

  def create(conn, %{"amount" => amount, "currency" => currency, "token" => token}) do
    case PaymentGateway.charge(amount, currency, token) do
      {:ok, payment} ->
        conn
        |> put_status(:ok)
        |> render(%{payment: payment})
      {:error, reason} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(%{error: reason})
    end
  end
end
