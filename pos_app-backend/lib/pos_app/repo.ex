defmodule PosApp.Repo do
  use Ecto.Repo,
    otp_app: :pos_app,
    adapter: Ecto.Adapters.Postgres
end
