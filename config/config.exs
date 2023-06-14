import Config

config :tableau, :reloader,
  patterns: [
    ~r"lib/.*.ex"
  ]

config :temple,
  engine: EEx.SmartEngine,
  attributes: {Temple, :attributes}

config :tailwind,
  version: "3.2.4",
  default: [
    args: ~w(
    --config=assets/tailwind.config.js
    --input=assets/css/app.css
    --output=_site/css/site.css
    )
  ]

config :tableau, :assets, tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}

import_config "#{Mix.env()}.exs"
