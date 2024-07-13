defmodule PosApp.Accounts.LoyaltyProgram do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loyalty_programs" do
    field :name, :string
    field :description, :string
    field :points_required, :integer
    field :points_rewarded, :integer

    timestamps()
  end

  @doc false
  def changeset(loyalty_program, attrs) do
    loyalty_program
    |> cast(attrs, [:name, :description, :points_required, :points_rewarded])
    |> validate_required([:name, :description, :points_required, :points_rewarded])
  end
end
