defmodule MqttClient do
  use Hulaaki.Client

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
