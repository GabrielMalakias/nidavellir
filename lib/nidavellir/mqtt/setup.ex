defmodule Nidavellir.Mqtt.Setup do
  @moduledoc """
  It just starts an mqtt connection using the right parameters
  """

  alias Nidavellir.Mqtt.Connection, as: Connection

  def start do
    {:ok, pid} = Connection.connect

    subscribe(pid)
  end

  defp subscribe(pid) do
    options = [topics: topics(), qoses: [0], id: packet_id()]

    Connection.subscribe(pid, options)
  end

  defp packet_id do
    :rand.uniform(65_535)
  end

  defp topics do
    ["#"]
  end
end
