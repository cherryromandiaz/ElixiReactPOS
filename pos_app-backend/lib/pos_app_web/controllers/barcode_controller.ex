# lib/pos_app_web/controllers/barcode_controller.ex
defmodule PosAppWeb.BarcodeController do
  use PosAppWeb, :controller

  alias PosApp.Inventory
  alias PosApp.Inventory.Product

  def scan(conn, %{"barcode" => barcode}) do
    product = Inventory.get_product_by_barcode(barcode)

    case product do
      nil -> 
        send_resp(conn, :not_found, "Product not found")
      _product ->
        render(conn, "show.json", product: product)
    end
  end

  def scan_data(conn, %{"data" => data}) do
    # Optionally process the scanned data
    json(conn, %{result: data})
  end
end
