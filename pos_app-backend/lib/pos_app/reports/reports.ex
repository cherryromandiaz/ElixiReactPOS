# lib/pos_app/reports/reports.ex
defmodule PosApp.Reports do
  import Ecto.Query, warn: false
  alias PosApp.Repo
  alias PosApp.Sales.Sale
  alias PosApp.Inventory.Product

  def generate_sales_report do
    from(s in Sale, select: %{total_sales: sum(s.total_price), total_items_sold: sum(s.quantity)})
    |> Repo.one()
  end

  def generate_inventory_report do
    from(p in Product, select: %{product: p.name, stock: p.stock})
    |> Repo.all()
  end

  def generate_financial_report do
    # Example calculation for financial report
    total_revenue = from(s in Sale, select: sum(s.total_price)) |> Repo.one()
    total_cost = from(p in Product, select: sum(p.price * p.stock)) |> Repo.one()
    profit = total_revenue - total_cost

    %{
      total_revenue: total_revenue,
      total_cost: total_cost,
      profit: profit
    }
  end
end
