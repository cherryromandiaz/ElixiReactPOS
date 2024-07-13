defmodule PosApp.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :price, :decimal
      add :stock, :integer
      add :barcode, :string

      timestamps()
    end
  end
end
