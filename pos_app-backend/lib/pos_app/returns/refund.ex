defmodule PosApp.Returns.Refund do
  use Ecto.Schema
  import Ecto.Changeset

  schema "refunds" do
    field :return_id, :integer
    field :payment_method, :string
    field :amount, :decimal

    timestamps()
  end

  @doc false
  def changeset(refund, attrs) do
    refund
    |> cast(attrs, [:return_id, :payment_method, :amount])
    |> validate_required([:return_id, :payment_method, :amount])
  end
end
