defmodule UnemploymentRecords.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      UnemploymentRecords.Repo,
      # Start the Telemetry supervisor
      UnemploymentRecordsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: UnemploymentRecords.PubSub},
      # Start the Endpoint (http/https)
      UnemploymentRecordsWeb.Endpoint
      # Start a worker by calling: UnemploymentRecords.Worker.start_link(arg)
      # {UnemploymentRecords.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UnemploymentRecords.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UnemploymentRecordsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
