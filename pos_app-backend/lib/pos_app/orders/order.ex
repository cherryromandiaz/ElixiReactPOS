# lib/pos_app/orders/order.ex
defmodule PosApp.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :status, :string
    field :total_amount, :decimal
    belongs_to :customer, PosApp.Customers.Customer

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_id, :status, :total_amount])
    |> validate_required([:customer_id, :status, :total_amount])
  end
end

defmodule PosApp.Orders do
  import Ecto.Query, warn: false
  alias PosApp.Repo

  alias PosApp.Orders.Order

  def list_orders do
    Repo.all(Order)
  end

  def get_order!(id), do: Repo.get!(Order, id)

  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  def change_order(%Order{} = order) do
    Order.changeset(order, %{})
  end
end
