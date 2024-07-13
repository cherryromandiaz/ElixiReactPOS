# lib/pos_app/returns/return.ex
defmodule PosApp.Returns.Return do
  use Ecto.Schema
  import Ecto.Changeset

  schema "returns" do
    field :date, :naive_datetime
    field :customer_id, :integer
    field :products, {:array, :map}
    field :reason, :string
    field :status, :string, default: "pending" # Status options: pending, processed, cancelled

    timestamps()
  end

  @doc false
  def changeset(return, params \\ %{}) do
    return
    |> cast(params, [:date, :customer_id, :products, :reason, :status])
    |> validate_required([:date, :customer_id, :products, :reason, :status])
  end
end
