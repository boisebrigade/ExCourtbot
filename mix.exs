defmodule Courtbot.Mixfile do
  use Mix.Project

  def project do
    [
      app: :courtbot,
      version: "0.3.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Courtbot.Application, []},
      extra_applications: [:sasl, :logger, :runtime_tools, :hackney, :jason, :tzdata]
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
      {:phoenix, "~> 1.4"},
      {:ecto, "~> 3.0"},
      {:ecto_sql, "~> 3.0"},
      {:phoenix_ecto, "~> 4.0"},
      {:postgrex, ">= 0.0.0"},
      {:cloak, "~> 0.7.0"},
      {:gettext, "~> 0.11"},
      {:csv, "~> 2.0.0"},
      {:jason, "~> 1.1"},
      {:aes256, "~> 0.5.0"},
      {:sched_ex, "~> 1.0"},
      {:timex, "~> 3.1"},
      {:plug_cowboy, "~> 2.0"},
      {:ex_twiml, "~> 2.1.3"},
      {:telemetry, "~> 0.4.0"},
      {:tesla, "~> 1.2.1"},
      {:flow, "~> 0.14"},
      {:hackney, "~> 1.15.0"},
      {:stream_data, "~> 0.1", only: [:dev, :test]},
      {:tzdata, "~> 1.0.0-rc.0", override: true},
      {:ex_doc, "~> 0.18.0", only: :dev, runtime: false},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:earmark, "~> 1.2", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.6", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:html_entities, "~> 0.4", only: :test},
      {:distillery, "~> 2.0", runtime: false},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false}
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
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
