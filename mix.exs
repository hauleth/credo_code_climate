defmodule CredoCodeClimate.MixProject do
  use Mix.Project

  def project do
    [
      app: :credo_code_climate,
      description: "Credo plugin for writing the CodeClimate-like result file",
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  defp package do
    [
      licenses: ~w[MIT],
      links: %{
        "GitHub" => "https://github.com/hauleth/credo_code_climate",
        "Credo" => "https://hex.pm/packages/credo"
      }
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.5"},
      {:jason, "~> 1.2"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
