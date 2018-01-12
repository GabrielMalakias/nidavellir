defmodule Nidavellir.Mixfile do
  use Mix.Project

  def project do
    [app: :nidavellir,
     version: "0.1.0",
     elixir: "~> 1.5.3",
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :redix],
    mod: { Nidavellir, []}]
  end

  defp deps do
    [
      {:redix, ">= 0.0.0"},
      {:hulaaki, "~> 0.1.1"}
    ]
  end
end
