defmodule LiveViewNativeTest.Iced.Layouts.Iced do
  use LiveViewNative.Component,
    format: :iced

  import Phoenix.Controller, only: [get_csrf_token: 0]

  embed_templates "layouts_iced/*"
end
