defmodule LiveViewNative.Iced.MixProject do
  use Mix.Project
  @version "0.3.1"
  @source_url "https://github.com/liveview-native/liveview-client-iced"

  def project do
    [
      app: :live_view_native_iced,
      version: @version,
      elixir: "~> 1.15",
      description: description(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def cli do
    [
      preferred_envs: [docs: :docs, "hex.publish": :docs]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_env), do: ["lib"]

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: [:docs, :test]},
      {:makeup_swift, "~> 0.0.1", only: [:docs, :test]},
      {:makeup_json, "~> 0.1.0", only: [:docs, :test]},
      {:makeup_eex, ">= 0.1.1"},
      {:floki, ">= 0.30.0", only: :test},
      {:live_view_native, github: "liveview-native/live_view_native", override: true},
      {:live_view_native_stylesheet, "~> 0.3.1", only: :test},
      {:live_view_native_live_form, github: "liveview-native/liveview-native-live-form", only: :test},
      {:gettext, "~> 0.20", only: :test},
      {:live_view_native_test_endpoint, github: "liveview-native/live_view_native_test_endpoint", branch: "main", only: :test},
      {:nimble_parsec, "~> 1.3"}
    ]
  end

  defp docs do
    [
      extras: extras(),
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end

  defp description, do: "LiveView Native Iced Client"

  defp extras do
    ["README.md"]
  end

  defp package do
    %{
      maintainers: ["Brian Cardarella"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Built by DockYard, Expert Elixir & Phoenix Consultants" =>
          "https://dockyard.com/phoenix-consulting"
      }
    }
  end
end
