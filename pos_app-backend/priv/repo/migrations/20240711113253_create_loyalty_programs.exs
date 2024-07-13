defmodule PosApp.Repo.Migrations.CreateLoyaltyPrograms do
  use Ecto.Migration

  def change do
    create table(:loyalty_programs) do
      add :name, :string
      add :description, :string
      add :points_required, :integer
      add :points_rewarded, :integer

      timestamps()
    end
  end
end
