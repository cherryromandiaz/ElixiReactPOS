# lib/pos_app/loyalty_programs/loyalty_program.ex
defmodule PosApp.LoyaltyPrograms.LoyaltyProgram do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loyalty_programs" do
    field :name, :string
    field :description, :string
    field :discount_percentage, :decimal

    # Add more fields as needed

    timestamps()
  end

  @doc false
  def changeset(loyalty_program, params \\ %{}) do
    loyalty_program
    |> cast(params, [:name, :description, :discount_percentage])
    |> validate_required([:name, :discount_percentage])
    |> validate_number(:discount_percentage, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
  end
end
