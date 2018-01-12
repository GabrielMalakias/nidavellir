defmodule Nidavellir.Mqtt do
  use GenServer
  use Hulaaki.Client

  def start do
    options = [
      host: Application.get_env(:nidavellir, :host),
      port: Application.get_env(:nidavellir, :port),
      timeout: Application.get_env(:nidavellir, :timeout),
      client_id: Application.get_env(:nidavellir, :client_prefix)
    ]


 #   Nidavellir.Mqtt.connect(pid, options)
  end

  def handle_call(msg, _from, state) do
    {:reply, msg, state}
  end

  def on_connect_ack(options) do
    IO.inspect options
  end

  def on_subscribed_publish(options) do
    IO.inspect options
  end

  def on_subscribe_ack(options) do
    IO.inspect options
  end

  def on_ping_response(options) do
    IO.inspect options
  end
end
