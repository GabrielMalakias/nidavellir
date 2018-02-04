defmodule Nidavellir.Mqtt.Setup do
  def start do
    {:ok, pid} = Nidavellir.Mqtt.Connection.connect

    subscribe(pid)
  end

  defp subscribe(pid) do
    options = [topics: topics(), qoses: [0], id: packet_id()]

    Nidavellir.Mqtt.Connection.subscribe(pid, options)
  end

  defp packet_id do
    :rand.uniform(65535)
  end

  defp topics do
    ["#"]
  end
end


