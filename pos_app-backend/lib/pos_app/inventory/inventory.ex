# lib/pos_app/inventory/inventory.ex
defmodule PosApp.Inventory do
  import Ecto.Query, warn: false
  alias PosApp.Repo

  alias PosApp.Inventory.Product

  def list_products do
    Repo.all(Product)
  end

  def get_product!(id), do: Repo.get!(Product, id)

  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def update_stock(product_id, quantity) do
  product = get_product!(product_id)
  
  new_stock = product.stock + quantity
  
  product
    |> Product.changeset(%{stock: new_stock})
    |> Repo.update()
  end

  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end
  
  def get_product_by_barcode(barcode) do
    Repo.get_by(Product, barcode: barcode)
  end
end
