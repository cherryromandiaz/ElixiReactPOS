# lib/pos_app_web/plugs/auth_pipeline.ex
defmodule PosAppWeb.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :pos_app,
    module: PosApp.Guardian,
    error_handler: PosAppWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, scheme: "Bearer"
  plug Guardian.Plug.LoadResource
end
