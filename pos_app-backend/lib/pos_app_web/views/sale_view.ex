# lib/pos_app_web/views/sale_view.ex
defmodule PosAppWeb.SaleView do
  use PosAppWeb, :view
  alias PosAppWeb.SaleView

  def render("index.json", %{sales: sales}) do
    %{data: render_many(sales, SaleView, "sale.json")}
  end

  def render("show.json", %{sale: sale}) do
    %{data: render_one(sale, SaleView, "sale.json")}
  end

  def render("sale.json", %{sale: sale}) do
    %{
      id: sale.id,
      product_id: sale.product_id,
      quantity: sale.quantity,
      total_price: sale.total_price
    }
  end
end
