# lib/pos_app_web/controllers/customer_controller.ex
defmodule PosAppWeb.CustomerController do
  use PosAppWeb, :controller

  alias PosApp.Customers.Customer

  def index(conn, _params) do
    customers = Customer.list_customers() # Implement list_customers in your context
    render(conn, json: %{customers: customers})
  end

  def show(conn, %{"id" => id}) do
    customer = Customer.get_customer!(id)
    render(conn, json: customer)
  end

  def create(conn, %{"customer" => customer_params}) do
    case Customer.create_customer(customer_params) do
      {:ok, customer} ->
        conn
        |> put_status(:created)
        |> render(json: customer)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(json: %{errors: Ecto.Changeset.traverse_errors(changeset, & &1)})
    end
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    case Customer.update_customer(id, customer_params) do
      {:ok, customer} ->
        render(conn, json: customer)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(json: %{errors: Ecto.Changeset.traverse_errors(changeset, & &1)})
    end
  end

  def delete(conn, %{"id" => id}) do
    Customer.delete_customer!(id)
    send_resp(conn, :no_content, "")
  end
end
