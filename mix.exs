defmodule ElixirTools.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_tools,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:temple] ++ Mix.compilers(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:telemetry, :logger]
    ]
  end

  def aliases() do
    [
      build: ["tableau.build", "tailwind default --minify"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tableau, "~> 0.11.0"},
      # {:tableau, path: "../tableau"},
      {:floki, "~> 0.34"},
      {:temple, "~> 0.12"},
      {:tailwind, "~> 0.2", runtime: Mix.env() == :dev}
    ]
  end
end
