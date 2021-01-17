defmodule CredoCodeClimate.MixProject do
  use Mix.Project

  def project do
    [
      app: :credo_code_climate,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:credo, "~> 1.5"},
      {:jason, "~> 1.2"}
    ]
  end
end
