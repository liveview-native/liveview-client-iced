# LiveViewNative Iced

A LiveView Native client for the [Iced Rust UI framework](https://iced.rs/)

> #### Client Spec {: .info}
>
> ```elixir
> format: :iced
> module_suffix: "Iced"
> template_sigil: ~LVN
> component: LiveViewNative.Iced.Component
> targets: ~w{}
> ```

The LiveViewNative Rust package lets you use Phoenix LiveView to build native Iced UI applications.

## Installation

### Elixir
If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `live_view_native_iced` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:live_view_native_iced, "~> 0.3.0"}
  ]
end
```

### Iced

You can install the client either by running the generator from Elixir

### Generate Project

1. Run `mix help lvn.iced.gen` to see the options available for the generator
2. Run `mix lvn.gen --no-copy` to print the configuration settings to add to support Iced in your application.
3. Run `mix lvn.iced.gen` to ensure you get the properly generated files. Please note this may overwrite an existing Xcode project.

## Post-Installation

After installation will want to enable an exist LiveView for LiveView Native SwiftUI.

1. Run `mix lvn.gen.live iced <ContextModule>`
2. Add `use <NativeModule>, :live_view` to the LiveView module

#### Example

```
> mix lvn.gen.live iced Home
* creating lib/my_demo_web/live/home_live.iced.ex
* creating lib/my_demo_web/live/swiftui/home_live.iced.neex
```

```elixir
defmodule MyDemoWeb.HomeLive do
  use MyDemoWeb, :live_view
  use MyDemoNative, :live_view
end
```

## Usage

This plugin provides the SwiftUI rendering behavior of a Phoenix LiveView. Start by adding this plugin to a LiveView. We do this with `LiveViewNative.LiveView`:

```elixir
defmodule MyAppWeb.HomeLive do
  use MyAppWeb :live_view
  use LiveViewNative.LiveView,
    formats: [:iced],
    layouts: [
      iced: {MyAppWeb.Layouts.Iced, :app}
    ]

end
```

then just like all format LiveView Native rendering components you will create a new module namespaced under the calling module with the `module_suffix` appended:

```elixir
defmodule MyAppWeb.HomeLive.Iced do
  use LiveViewNative.Component,
    format: :iced

  def render(assigns, _interface) do
    ~LVN"""
    <Text>Hello, Iced!</Text>
    """
  end
end
```

Further details on additional options and an explanation of template rendering vs using `render/2` are in the LiveView Native docs.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/live_view_native_swiftui>.
