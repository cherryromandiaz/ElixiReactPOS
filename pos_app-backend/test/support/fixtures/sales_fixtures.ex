defmodule PosApp.SalesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PosApp.Sales` context.
  """

  @doc """
  Generate a sale.
  """
  def sale_fixture(attrs \\ %{}) do
    {:ok, sale} =
      attrs
      |> Enum.into(%{
        quantity: 42,
        total_price: "120.5"
      })
      |> PosApp.Sales.create_sale()

    sale
  end
end
