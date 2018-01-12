defmodule Nidavellir.Mqtt.PubSpawner do
  def start_link do
    Task.start_link(fn -> handle(%{}) end)
  end

  defp handle(map) do
    receive do
    end
  end
end
