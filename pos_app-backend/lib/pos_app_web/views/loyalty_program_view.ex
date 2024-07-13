defmodule PosAppWeb.LoyaltyProgramView do
  use PosAppWeb, :view

  def render("index.json", %{loyalty_programs: loyalty_programs}) do
    %{data: render_many(loyalty_programs, __MODULE__, "loyalty_program.json")}
  end

  def render("show.json", %{loyalty_program: loyalty_program}) do
    %{data: render_one(loyalty_program, __MODULE__, "loyalty_program.json")}
  end

  def render("loyalty_program.json", %{loyalty_program: loyalty_program}) do
    %{
      id: loyalty_program.id,
      name: loyalty_program.name,
      description: loyalty_program.description,
      points_required: loyalty_program.points_required,
      points_rewarded: loyalty_program.points_rewarded
    }
  end

  def render("errors.json", %{changeset: changeset}) do
    %{
      errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
    }
  end
end
