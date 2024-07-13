# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :pos_app, PosApp.Guardian,
  issuer: "pos_app",
  secret_key: "UJM0VDYweUwC4eEi7W6AWeuHfmxp9OR2hef3AlhsJl7B5pn6rqyqAQacgeXXuLC6"

config :pos_app, :payment_gateway,
  api_key: System.get_env("PAYMENT_GATEWAY_API_KEY"),
  environment: System.get_env("PAYMENT_GATEWAY_ENV")

config :pos_app,
  ecto_repos: [PosApp.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :pos_app, PosAppWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: PosAppWeb.ErrorHTML, json: PosAppWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: PosApp.PubSub,
  live_view: [signing_salt: "6Uro/MDR"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :pos_app, PosApp.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  pos_app: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.3",
  pos_app: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
