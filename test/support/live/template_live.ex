defmodule LiveViewNativeTest.Iced.TemplateLive.Iced do
  use LiveViewNative.Component,
    format: :iced,
    as: :render
end

defmodule LiveViewNativeTest.Iced.TemplateLive do
  use Phoenix.LiveView,
    layout: false

  use LiveViewNative.LiveView,
    formats: [:iced],
    layouts: [
      iced: {LiveViewNativeTest.Iced.Layouts.Iced, :app}
    ]

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :count, 100)}
  end

  def render(assigns), do: ~H""
end
