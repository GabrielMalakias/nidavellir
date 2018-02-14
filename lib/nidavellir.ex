defmodule Nidavellir do
  use Application

  @moduledoc """
  Documentation for Nidavellir.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Nidavellir.hello
      :world

  """

  alias Nidavellir.Mqtt.Setup, as: Setup

  def hello do
    :world
  end

  def start(_type, _args) do
    sup = Nidavellir.Supervisor.start_link([])

    Setup.start()

    sup
  end
end
