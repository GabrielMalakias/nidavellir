defmodule Nidavellir.Mixfile do
  use Mix.Project

  def project do
    [app: :nidavellir,
     version: "0.1.0",
     elixir: "~> 1.6.0",
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :cowboy, :plug],
    mod: { Nidavellir, []}]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:hulaaki, "~> 0.1.1"},
      {:credo, "~> 0.9.0-rc1", only: [:dev, :test], runtime: false}
    ]
  end
end
