# lib/pos_app/customers/customer.ex
defmodule PosApp.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :name, :string
    field :email, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(customer, params \\ %{}) do
    customer
    |> cast(params, [:name, :email, :phone])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
  end

  def list_customers() do
    Repo.all(Customer)
  end

  def get_customer!(id) do
    Repo.get!(Customer, id)
  end

  def create_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
    |> Repo.insert()
  end

  def update_customer(id, attrs \\ %{}) do
    customer = get_customer!(id)
    customer
    |> Customer.changeset(attrs)
    |> Repo.update()
  end

  def delete_customer!(id) do
    customer = get_customer!(id)
    Repo.delete!(customer)
  end
end
