defmodule PosApp.Sales.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales" do
    field :quantity, :integer
    field :total_price, :decimal
    field :product_id, :id
    field :user_id, :id
    belongs_to :product, PosApp.Inventory.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(sale, attrs) do
    sale
    |> cast(attrs, [:quantity, :total_price])
    |> validate_required([:quantity, :total_price])
  end
end
