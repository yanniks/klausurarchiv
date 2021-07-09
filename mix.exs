defmodule Klausurarchiv.Mixfile do
  use Mix.Project

  def project do
    [
      app: :klausurarchiv,
      version: "0.0.1",
      elixir: "~> 1.11.0",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      releases: [
        klausurarchiv: [
          include_executables_for: [:unix],
          applications: [runtime_tools: :permanent]
        ]
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Klausurarchiv.Application, []},
      extra_applications: [:logger, :runtime_tools, :httpoison]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:appsignal_phoenix, "~> 2.0.0"},
      {:appsignal, "~> 2.0"},
      {:argon2_elixir, "~> 2.0"},
      {:bamboo_smtp, "~> 4.0"},
      {:bamboo, "~> 2.0"},
      {:comeonin, "~> 5.3.0"},
      {:cowboy, "~> 2.0"},
      {:ecto_enum, "~> 1.2"},
      {:gettext, "~> 0.18"},
      {:httpoison, "~> 1.7"},
      {:jason, "~> 1.2"},
      {:number, "~> 1.0.1"},
      {:phoenix_ecto, "~> 4.3.0"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_view, "~> 0.15.0"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_slime, "~> 0.13.0"},
      {:phoenix, "~> 1.5"},
      {:plug_cowboy, "~> 2.3"},
      {:plug_preferred_locales, "~> 0.1.0"},
      {:postgrex, "~> 0.15"},
      {:sentry, "~> 8.0"},
      {:timex, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:floki, ">= 0.27.0", only: :test}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      ci: ["deps.get", "test"]
    ]
  end
end
