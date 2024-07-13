# lib/pos_app_web/controllers/dashboard_controller.ex
defmodule PosAppWeb.DashboardController do
  use PosAppWeb, :controller

  alias PosApp.Sales

  def overview(conn, _params) do
    sales_summary = Sales.get_sales_summary()
    order_status = Sales.get_order_status()
    inventory_status = Sales.get_inventory_status()

    json(conn, %{
      sales_summary: sales_summary,
      order_status: order_status,
      inventory_status: inventory_status
    })
  end
end
