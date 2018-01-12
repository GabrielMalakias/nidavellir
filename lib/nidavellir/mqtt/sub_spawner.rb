defmodule Nidavellir.Mqtt.SubSpawner do
  def start_link do
    Task.start_link(fn -> listen(%{}) end)
  end

  defp listen(map) do
    receive do
    end
  end
end
