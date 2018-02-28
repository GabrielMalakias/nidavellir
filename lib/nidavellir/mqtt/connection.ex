require IEx
defmodule Nidavellir.Mqtt.Connection do
  @moduledoc """
  This module is the main responsible for dealing with
  the Mqtt connection and sending it to agents
  """

  alias Nidavellir.Component, as: Component
  use Hulaaki.Client

  def start_link(state, opts) do
    process_name = Keyword.get(opts, :name, __MODULE__)

    GenServer.start_link(__MODULE__, state, name: process_name)
  end

  def process(identifier \\ :mqtt) do
    Process.whereis(identifier)
  end

  def handle_info(:verify, state) do
    connection_pid = state.connection

    if !(connection_pid && Process.alive?(connection_pid)) do
      Process.send_after(self(), :connect, 20)
    end

    {:noreply,  state}
  end

  def connect do
    connect(process())
  end

  def connect(connection_pid) do
    connect(connection_pid, config())

    {:ok, connection_pid}
  end

  def config do
    [
      host: Application.get_env(:nidavellir, :host),
      port: Application.get_env(:nidavellir, :port),
      timeout: Application.get_env(:nidavellir, :timeout),
      client_id: Application.get_env(:nidavellir, :client_prefix),
      keep_alive: 200
    ]
  end

  def on_connect_ack(options) do
    IO.inspect options
  end

  def on_subscribed_publish(options) do
    message = Keyword.get(options, :message)

    Component.handle_message(message)

    IO.inspect message
  end

  def on_subscribe_ack(options) do
    IO.inspect options
  end

  def on_ping_response(options) do
    IO.inspect options
  end
end
