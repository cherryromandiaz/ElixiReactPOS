# lib/pos_app_web/controllers/product_controller.ex
defmodule PosAppWeb.ProductController do
  use PosAppWeb, :controller

  alias PosApp.Inventory
  alias PosApp.Inventory.Product

  action_fallback PosAppWeb.FallbackController

  def index(conn, _params) do
    products = Inventory.list_products()
    render(conn, "index.json", products: products)
  end

  def create(conn, %{"product" => product_params}) do
    with {:ok, %Product{} = product} <- Inventory.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.product_path(conn, :show, product))
      |> render("show.json", product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Inventory.get_product!(id)
    render(conn, "show.json", product: product)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Inventory.get_product!(id)

    with {:ok, %Product{} = product} <- Inventory.update_product(product, product_params) do
      render(conn, "show.json", product: product)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Inventory.get_product!(id)

    with {:ok, %Product{}} <- Inventory.delete_product(product) do
      send_resp(conn, :no_content, "")
    end
  end

  def scan_barcode(conn, %{"barcode" => barcode}) do
    product = Inventory.get_by(Product, barcode: barcode)
  
    if product do
      render(conn, "show.json", product: product)
    else
      send_resp(conn, :not_found, "Product not found")
    end
  end
end
