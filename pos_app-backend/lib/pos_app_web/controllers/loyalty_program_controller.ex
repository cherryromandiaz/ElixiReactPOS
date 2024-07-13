defmodule PosAppWeb.LoyaltyProgramController do
  use PosAppWeb, :controller

  alias PosApp.Accounts.LoyaltyProgram
  alias PosApp.Accounts

  def index(conn, _params) do
    loyalty_programs = Accounts.list_loyalty_programs()
    render(conn, "index.json", loyalty_programs: loyalty_programs)
  end

  def show(conn, %{"id" => id}) do
    loyalty_program = Accounts.get_loyalty_program!(id)
    render(conn, "show.json", loyalty_program: loyalty_program)
  end

  def create(conn, %{"loyalty_program" => loyalty_program_params}) do
    case Accounts.create_loyalty_program(loyalty_program_params) do
      {:ok, loyalty_program} ->
        conn
        |> put_status(:created)
        |> render("show.json", loyalty_program: loyalty_program)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("errors.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "loyalty_program" => loyalty_program_params}) do
    loyalty_program = Accounts.get_loyalty_program!(id)

    case Accounts.update_loyalty_program(loyalty_program, loyalty_program_params) do
      {:ok, loyalty_program} ->
        render(conn, "show.json", loyalty_program: loyalty_program)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("errors.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    loyalty_program = Accounts.get_loyalty_program!(id)

    case Accounts.delete_loyalty_program(loyalty_program) do
      {:ok, _deleted} ->
        send_resp(conn, :no_content, "")
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("errors.json", changeset: changeset)
    end
  end
end
