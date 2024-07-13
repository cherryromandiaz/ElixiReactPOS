# lib/pos_app/notifications/notifications.ex
defmodule PosApp.Notifications do
  import Ecto.Query, warn: false
  alias PosApp.Repo
  alias PosApp.Notifications.Notification

  def list_notifications do
    Repo.all(Notification)
  end

  def mark_as_read(id) do
    Repo.get!(Notification, id)
    |> Ecto.Changeset.change(%{is_read: true})
    |> Repo.update()
  end
end
