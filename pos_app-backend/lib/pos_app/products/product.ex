# lib/pos_app/products/product.ex
defmodule PosApp.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :stock_quantity, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(product, params \\ %{}) do
    product
    |> cast(params, [:name, :description, :price, :stock_quantity])
    |> validate_required([:name, :price])
    |> validate_number(:price, greater_than: 0)
  end

  def update_stock(product_id, quantity) do
    # Implement logic to update stock quantity for a product
    case Repo.get(Product, product_id) do
      nil -> {:error, "Product not found"}
      product ->
        new_stock = product.stock_quantity + String.to_integer(quantity)
        product
        |> Product.changeset(%{stock_quantity: new_stock})
        |> Repo.update()
    end
  end
end
