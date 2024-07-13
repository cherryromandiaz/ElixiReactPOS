# lib/pos_app/sales/sales.ex
defmodule PosApp.Sales do
  import Ecto.Query, warn: false
  alias PosApp.Repo

  alias PosApp.Sales.{Sale, Order}
  alias PosApp.Inventory.Product

  def get_sales_summary do
    Repo.all(
      from s in Sale,
      select: %{
        total_sales: sum(s.total_price),
        total_items_sold: sum(s.quantity)
      }
    )
    |> List.first()
  end

  def get_order_status do
    Repo.all(
      from o in Order,
      group_by: o.status,
      select: %{
        status: o.status,
        count: count(o.id)
      }
    )
  end

  def get_inventory_status do
    Repo.all(
      from p in Product,
      select: %{
        product: p.name,
        stock: p.stock
      }
    )
  end
end
