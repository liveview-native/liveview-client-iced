import Config

# config :live_view_native_stylesheet, :parsers, swiftui: LiveViewNative.Iced.RulesParser

config :live_view_native_stylesheet,
  annotations: false

config :phoenix_template, format_encoders: [
  iced: Phoenix.HTML.Engine
]

config :phoenix, template_engines: [
  neex: LiveViewNative.Engine
]

config :mime, :types, %{
  "text/iced" => ["iced"]
}

config :live_view_native_test_endpoint,
  formats: [:iced],
  otp_app: :live_view_native_iced,
  routes: [
    %{path: "/inline", module: LiveViewNativeTest.Iced.InlineLive},
    %{path: "/template", module: LiveViewNativeTest.Iced.TemplateLive}
  ]

config :phoenix, :plug_init_mode, :runtime

config :live_view_native_stylesheet,
  content: [
    iced: [
      "test/**/*.*"
    ]
  ],
  output: "priv/static/assets"
