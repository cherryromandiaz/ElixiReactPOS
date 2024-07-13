# lib/pos_app_web/controllers/return_controller.ex

# lib/pos_app_web/controllers/return_controller.ex
defmodule PosAppWeb.ReturnController do
  use PosAppWeb, :controller

  alias PosApp.Returns.Return

  def index(conn, _params) do
    returns = Return.list_returns() # Implement list_returns in your context
    render(conn, json: %{returns: returns})
  end

  def show(conn, %{"id" => id}) do
    return = Return.get_return!(id)
    render(conn, json: return)
  end

  def create(conn, %{"return" => return_params}) do
    case Return.create_return(return_params) do
      {:ok, return} ->
        conn
        |> put_status(:created)
        |> render(json: return)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(json: %{errors: Ecto.Changeset.traverse_errors(changeset, & &1)})
    end
  end

  def update(conn, %{"id" => id, "return" => return_params}) do
    case Return.update_return(id, return_params) do
      {:ok, return} ->
        render(conn, json: return)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(json: %{errors: Ecto.Changeset.traverse'return: return_params', & &1)})
    end
  end

  def delete(conn, %{"id" => id}) do
    Return.delete_return!(id)
    send_resp(conn, :no_content, "")
  end

  def process_refund(conn, %{"id" => id}) do
    case Return.process_refund(id) do
      {:ok, return} ->
        render(conn, json: return)
      {:error, message} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(json: %{error: message})
    end
  end
end