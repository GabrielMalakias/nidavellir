defmodule Nidavellir.Trigger.Agent do
  use Agent

  def start_link(message) do
    name = topic_to_agent_name(message)


    Agent.start_link(fn -> %{} end, name: name)
  end


  def topic_to_agent_name(message) do
     parts = Map.get(message, :topic)
     |> String.split("/")

    id = Enum.at(parts, 3)
    type = Enum.at(parts, 2)
    user_id = Enum.at(parts, 1)

    Enum.join([type, id, user_id], "_")
    |> String.to_atom
  end
end
