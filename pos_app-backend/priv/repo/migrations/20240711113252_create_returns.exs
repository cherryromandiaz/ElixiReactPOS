# Generate migration
mix ecto.gen.migration create_returns

# Migration file (priv/repo/migrations/xxxxx_create_returns.exs)
defmodule PosApp.Repo.Migrations.CreateReturns do
  use Ecto.Migration

  def change do
    create table(:returns) do
      add :date, :naive_datetime
      add :customer_id, references(:customers)
      add :products, {:array, :map}
      add :reason, :string
      add :status, :string, default: "pending"
      
      timestamps()
    end
  end
end

# Seed data (priv/repo/seeds.exs)
alias PosApp.Repo
alias PosApp.Returns.Return

customer_id = 1 # Replace with actual customer ID from your database

returns = [
  %{
    date: ~N[2024-07-15 10:00:00],
    customer_id: customer_id,
    products: [%{id: 1, name: "Product A", quantity: 2}, %{id: 2, name: "Product B", quantity: 1}],
    reason: "Defective products",
    status: "pending"
  },
  %{
    date: ~N[2024-07-14 09:30:00],
    customer_id: customer_id,
    products: [%{id: 3, name: "Product C", quantity: 1}],
    reason: "Changed mind",
    status: "processed"
  }
]

Enum.each(returns, fn return ->
  Return.create_return(return)
end)
