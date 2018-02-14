require IEx
defmodule Nidavellir.Component do
  @moduledoc """
  This is the handler for the agents, it spawns new agents and updates them
  """
  alias Nidavellir.Mqtt.Message, as: Message

  def handle_message(message) do
    message
    |> Message.topic_to_agent_name
    |> Process.whereis
    |> update(message)
  end

  def update(pid, message) do
    if pid == nil do

      send_to_agent(start_agent(message), message)
    else
      update_agent(Nidavellir.Component.Agent.alive?(pid), message)
    end
  end

  def update_agent({:ok, pid}, message) do
    send_to_agent(pid, message)
  end

  def update_agent({:not_alive, pid}, message) do
    Agent.stop(pid)

    send_to_agent(start_agent(message), message)
  end

  def send_to_agent(pid, message) do
    Nidavellir.Component.Agent.update(pid, message)
  end

  def start_agent(message) do
    {:ok, pid} = Nidavellir.Component.Agent.start_link(message)
    pid
  end
end
