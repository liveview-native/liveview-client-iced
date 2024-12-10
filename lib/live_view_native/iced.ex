defmodule LiveViewNative.Iced do
  @moduledoc false

  use LiveViewNative,
    format: :iced,
    component: LiveViewNative.Iced.Component,
    module_suffix: :Iced,
    template_engine: LiveViewNative.Engine,
    stylesheet_rules_parser: LiveViewNative.Iced.RulesParser,
    client: LiveViewNative.Iced.Client

  def normalize_os_version(os_version),
    do: normalize_version(os_version)

  def normalize_app_version(app_version),
    do: normalize_version(app_version)

  defp normalize_version(version) do
    version
    |> String.split(".")
    |> Enum.map(fn(number) ->
      {number, _rem} = Integer.parse(number)
      number
    end)
  end
end
