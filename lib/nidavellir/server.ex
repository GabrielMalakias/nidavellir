defmodule Nidavellir.Mqtt do
  use GenServer

  def start_link(%{}) do
     GenServer.start_link(__module__, nil, {})
  end

  def handle_call(msg, _from, state) do
    {:ok, msg, state}
  end
end
