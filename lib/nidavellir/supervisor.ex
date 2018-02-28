defmodule Nidavellir.Supervisor do
  @moduledoc """
  It just creates the supervisor tree for this project
  """

  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      worker(Nidavellir.Mqtt.Connection, [%{}, [name: :mqtt]]),
      worker(Nidavellir.Mqtt.ReconnectServer, [[]])#,

      #      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: Nidavellir.Router, options: [port: 4001])
    ]

    opts = [strategy: :one_for_one]

    supervise(children, opts)
  end
end
