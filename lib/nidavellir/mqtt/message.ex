defmodule Nidavellir.Mqtt.Message do
  @moduledoc """
   Responsible for conversions and message encoding and decoding
  """

  @doc """

  Returns an agent name given an topic

  Example:
  iex> Nidavellir.Mqtt.Message.topic_to_agent_name "/users/10/sensors/10"
  :sensors_10
  """
  def topic_to_agent_name(%{topic: topic}) do
    topic
    |> String.split("/")
    |> Enum.slice(3, 2)
    |> Enum.join("_")
    |> String.to_atom
  end
end
