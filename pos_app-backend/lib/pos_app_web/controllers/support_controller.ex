# lib/pos_app_web/controllers/support_controller.ex
defmodule PosAppWeb.SupportController do
  use PosAppWeb, :controller

  def contact_info(conn, _params) do
    contact_info = %{
      phone_number: "+62 888 3432 744",
      email: "cherryromandiaz@gmail.com",
      developer: "Cherry Romandiaz"
    }

    json(conn, %{contact_info: contact_info})
  end
end
