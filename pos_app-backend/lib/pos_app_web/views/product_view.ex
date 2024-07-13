# lib/pos_app_web/views/product_view.ex
defmodule PosAppWeb.ProductView do
  use PosAppWeb, :view

  def render("show.json", %{product: product}) do
    %{
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      stock: product.stock,
      barcode: product.barcode
    }
  end

  # Other render functions...
end
