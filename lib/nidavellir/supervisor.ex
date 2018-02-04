defmodule Nidavellir.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      worker(Redix, [[], [name: :redix]]),
      worker(Nidavellir.Mqtt.Connection, [%{}, [name: :mqtt]]),
      worker(Nidavellir.Mqtt.ReconnectServer, [[]])
    ]

    opts = [strategy: :one_for_one]

    supervise(children, opts)
  end
end
