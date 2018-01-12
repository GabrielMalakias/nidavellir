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
  def hello do
    :world
  end

  def start(_type, _args) do
    sup =  Nidavellir.Supervisor.start_link([])

    IO.inspect Process.whereis(Nidavellir.Mqtt)

    sup
  end
end
