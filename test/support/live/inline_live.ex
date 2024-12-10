defmodule LiveViewNativeTest.Iced.InlineLive.Iced do
  use LiveViewNative.Component,
    format: :iced,
    as: :render

  def render(assigns, %{"target" => "ubuntu"}) do
    ~LVN"""
    <Text>Ubuntu Target Inline Iced Render {@count}</Text>
    """
  end

  def render(assigns, _interface) do
    ~LVN"""
    <Text>Inline Iced Render {@count}</Text>
    """
  end
end

defmodule LiveViewNativeTest.Iced.InlineLive do
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
