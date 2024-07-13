# lib/pos_app_web/controllers/time_entry_controller.ex
defmodule PosAppWeb.TimeEntryController do
  use PosAppWeb, :controller

  alias PosApp.EmployeeManagement.TimeEntry

  def index(conn, _params) do
    time_entries = TimeEntry.list_time_entries()
    render(conn, %{timeEntries: time_entries})
  end

  def show(conn, %{"id" => id}) do
    time_entry = TimeEntry.get_time_entry!(id)
    render(conn, %{timeEntry: time_entry})
  end

  def create(conn, %{"timeEntry" => time_entry_params}) do
    case TimeEntry.create_time_entry(time_entry_params) do
      {:ok, time_entry} ->
        conn
        |> put_status(:created)
        |> render(%{timeEntry: time_entry})
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(%{errors: Ecto.Changeset.traverse_errors(changeset, & &1)})
    end
  end

  def update(conn, %{"id" => id, "timeEntry" => time_entry_params}) do
    case TimeEntry.update_time_entry(id, time_entry_params) do
      {:ok, time_entry} ->
        render(conn, %{timeEntry: time_entry})
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(%{errors: Ecto.Changeset.traverse_errors(changeset, & &1)})
    end
  end

  def delete(conn, %{"id" => id}) do
    TimeEntry.delete_time_entry!(id)
    send_resp(conn, :no_content, "")
  end
end
