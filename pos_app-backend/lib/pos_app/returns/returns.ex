defmodule PosApp.Returns do
  import Ecto.Query, warn: false
  alias PosApp.Repo
  alias PosApp.Returns.{Return, Refund}

  # Returns functions

  def list_returns do
    Repo.all(Return)
  end

  def get_return!(id), do: Repo.get!(Return, id)

  def create_return(attrs \\ %{}) do
    %Return{}
    |> Return.changeset(attrs)
    |> Repo.insert()
  end

  def update_return(%Return{} = return, attrs) do
    return
    |> Return.changeset(attrs)
    |> Repo.update()
  end

  def delete_return(%Return{} = return) do
    Repo.delete(return)
  end

  # Refunds functions

  def list_refunds do
    Repo.all(Refund)
  end

  def get_refund!(id), do: Repo.get!(Refund, id)

  def create_refund(attrs \\ %{}) do
    %Refund{}
    |> Refund.changeset(attrs)
    |> Repo.insert()
  end

  def update_refund(%Refund{} = refund, attrs) do
    refund
    |> Refund.changeset(attrs)
    |> Repo.update()
  end

  def delete_refund(%Refund{} = refund) do
    Repo.delete(refund)
  end
end
