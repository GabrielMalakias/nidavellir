defmodule Nidavellir.Mqtt.MessageTest do
   use ExUnit.Case
   doctest Nidavellir.Mqtt.Message

   alias Nidavellir.Mqtt.Message, as: Message

   test "topic_to_agent_name/1 transforms an topic string to an agent name" do
     topic = "/users/10/sensor/1452"
     assert Message.topic_to_agent_name(topic) == :sensor_1452
   end
end
