defmodule Nidavellir.Mixfile do
  use Mix.Project

  def project do
    [app: :nidavellir,
     version: "0.1.0",
     elixir: "~> 1.6-dev",
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :redix]]
  end

  defp deps do
     [{:redix, ">= 0.0.0"}]
  end
end
