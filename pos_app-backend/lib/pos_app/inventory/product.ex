# lib/pos_app/inventory/product.ex
defmodule PosApp.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :stock, :integer
    field :barcode, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :stock, :barcode])
    |> validate_required([:name, :price, :stock, :barcode])
  end
end
