# priv/repo/migrations/[timestamp]_create_orders.exs
defmodule PosApp.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :customer_id, references(:customers, on_delete: :nothing)
      add :status, :string
      add :total_amount, :decimal

      timestamps()
    end

    create index(:orders, [:customer_id])
  end
end
