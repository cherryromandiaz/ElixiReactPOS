defmodule PosApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PosAppWeb.Telemetry,
      PosApp.Repo,
      {DNSCluster, query: Application.get_env(:pos_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PosApp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PosApp.Finch},
      # Start a worker by calling: PosApp.Worker.start_link(arg)
      # {PosApp.Worker, arg},
      # Start to serve requests, typically the last entry
      PosAppWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PosApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PosAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
