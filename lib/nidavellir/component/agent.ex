require IEx
defmodule Nidavellir.Component.Agent do
  @moduledoc """
  Agent data structure
  {
    // Immutable data
    type: 'string/int',
    event:  {
      mapping: [{
        trigger: "> 30" // (> 30, = 10, != 20)
        value: "hot"
      }]
    },

    // Mutable values
    data: {
       last_value: 10,
       current_value: 15,
       updated_at: 15:10
    }
  }
  """

  alias Nidavellir.Mqtt.Message, as: Message
  use Agent

  def start_link(message) do
    name = Message.topic_to_agent_name(message)

    Agent.start_link(&load_structure/0, name: name)
  end

  @doc """
  Gets from DB/Postgres and converts to an redis data structure
  """
  def load_structure do
    Map.new
    |> Map.put("event", %{})
    |> Map.put("data", new_data_node())
  end

  def alive?(pid) do
     if Process.alive?(pid) do
       {:ok, pid}
     else
       {:not_alive, pid}
     end
  end

  def update(pid, message) do
    Agent.get_and_update(pid, fn state ->
       update_state(state, message)
    end)
  end

  defp update_state(state, message) do
    last_value = state
                 |> Map.get("data", %{})
                 |> Map.get("current_value")

    data = Map.new
    |> Map.put("last_value", last_value)
    |> Map.put("current_value", message.message)
    |> Map.put("updated_at", DateTime.utc_now())

    {state, %{state | "data" => data}}
  end

  defp new_data_node do
    Map.new
    |> Map.put("last_value", 0)
    |> Map.put("current_value", 0)
    |> Map.put("updated_at", "")
  end
end
