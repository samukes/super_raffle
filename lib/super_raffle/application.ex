defmodule SuperRaffle.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SuperRaffleWeb.Telemetry,
      SuperRaffle.Repo,
      {DNSCluster, query: Application.get_env(:super_raffle, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SuperRaffle.PubSub},
      # Start a worker by calling: SuperRaffle.Worker.start_link(arg)
      # {SuperRaffle.Worker, arg},
      # Start to serve requests, typically the last entry
      SuperRaffleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SuperRaffle.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SuperRaffleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
