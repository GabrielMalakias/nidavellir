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
    import Supervisor.Spec, warn: false

    children = [
      worker(Redix, [[], [name: :redix]])
    ]

    opts = [strategy: :one_for_one, name: Nidavellir.RedixSupervisor]
    Supervisor.start_link(children, opts)
  end
end
