defmodule Nidavellir.Mqtt.ReconnectServer do
  @moduledoc """
  It's just a try to make an reconnection server
  """

  alias Nidavellir.Mqtt.Connection, as: Connection
  use GenServer

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    :timer.send_interval(reconnect_in(), :verify)

    {:ok, state}
  end

  def handle_info(:verify, state) do
    Connection.process
    |> send(:verify)

    {:noreply, state}
  end

  def reconnect_in do
    Application.get_env(:nidavellir, :reconnect_in)
  end
end
