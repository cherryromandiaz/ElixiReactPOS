defmodule PosApp.Repo.Migrations.CreateSales do
  use Ecto.Migration

  def change do
    create table(:sales) do
      add :quantity, :integer
      add :total_price, :decimal
      add :product_id, references(:products, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:sales, [:product_id])
    create index(:sales, [:user_id])
  end
end
