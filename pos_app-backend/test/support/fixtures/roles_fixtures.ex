defmodule PosApp.RolesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PosApp.Roles` context.
  """

  @doc """
  Generate a role.
  """
  def role_fixture(attrs \\ %{}) do
    {:ok, role} =
      attrs
      |> Enum.into(%{
        name: "some name",
        permissions: %{}
      })
      |> PosApp.Roles.create_role()

    role
  end

  @doc """
  Generate a user_role.
  """
  def user_role_fixture(attrs \\ %{}) do
    {:ok, user_role} =
      attrs
      |> Enum.into(%{

      })
      |> PosApp.Roles.create_user_role()

    user_role
  end
end
