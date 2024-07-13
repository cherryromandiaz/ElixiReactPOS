# lib/pos_app_web/controllers/role_controller.ex
defmodule PosAppWeb.RoleController do
  use PosAppWeb, :controller

  alias PosApp.EmployeeManagement.Role

  def index(conn, _params) do
    roles = Role.list_roles()
    render(conn, %{roles: roles})
  end

  def show(conn, %{"id" => id}) do
    role = Role.get_role!(id)
    render(conn, %{role: role})
  end

  def create(conn, %{"role" => role_params}) do
    case Role.create_role(role_params) do
      {:ok, role} ->
        conn
        |> put_status(:created)
        |> render(%{role: role})
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(%{errors: Ecto.Changeset.traverse_errors(changeset, & &1)})
    end
  end

  def update(conn, %{"id" => id, "role" => role_params}) do
    case Role.update_role(id, role_params) do
      {:ok, role} ->
        render(conn, %{role: role})
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(%{errors: Ecto.Changeset.traverse_errors(changeset, & &1)})
    end
  end

  def delete(conn, %{"id" => id}) do
    Role.delete_role!(id)
    send_resp(conn, :no_content, "")
  end
end
