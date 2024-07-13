# lib/pos_app_web/controllers/sale_controller.ex
defmodule PosAppWeb.SaleController do
  use PosAppWeb, :controller

  alias PosApp.Sales
  alias PosApp.Sales.Sale

  action_fallback PosAppWeb.FallbackController

  def index(conn, _params) do
    sales = Sales.list_sales()
    render(conn, "index.json", sales: sales)
  end

  def create(conn, %{"sale" => sale_params}) do
    with {:ok, %Sale{} = sale} <- Sales.create_sale(sale_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sale_path(conn, :show, sale))
      |> render("show.json", sale: sale)
    end
  end

  def show(conn, %{"id" => id}) do
    sale = Sales.get_sale!(id)
    render(conn, "show.json", sale: sale)
  end

  def update(conn, %{"id" => id, "sale" => sale_params}) do
    sale = Sales.get_sale!(id)

    with {:ok, %Sale{} = sale} <- Sales.update_sale(sale, sale_params) do
      render(conn, "show.json", sale: sale)
    end
  end

  def delete(conn, %{"id" => id}) do
    sale = Sales.get_sale!(id)

    with {:ok, %Sale{}} <- Sales.delete_sale(sale) do
      send_resp(conn, :no_content, "")
    end
  end
end
