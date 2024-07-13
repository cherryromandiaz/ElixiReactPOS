# lib/pos_app_web/controllers/stock_controller.ex
defmodule PosAppWeb.StockController do
  use PosAppWeb, :controller

  alias PosApp.Products.Product

  def update_stock(conn, %{"id" => id, "quantity" => quantity}) do
    case Product.update_stock(id, quantity) do
      {:ok, product} ->
        render(conn, json: product)
      {:error, reason} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(json: %{error: reason})
    end
  end
end
