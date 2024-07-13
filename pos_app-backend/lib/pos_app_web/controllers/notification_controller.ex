# lib/pos_app_web/controllers/notification_controller.ex
defmodule PosAppWeb.NotificationController do
  use PosAppWeb, :controller

  alias PosApp.Notifications

  def index(conn, _params) do
    notifications = Notifications.list_notifications()
    json(conn, %{notifications: notifications})
  end

  def mark_as_read(conn, %{"id" => id}) do
    Notifications.mark_as_read(id)
    send_resp(conn, :no_content, "")
  end
end
