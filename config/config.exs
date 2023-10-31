import Config

config :tableau, :reloader,
  patterns: [
    ~r"lib/.*.ex",
    ~r"_posts/.*.md",
    ~r"assets/.*.(css|js)"
  ]

config :temple,
  engine: EEx.SmartEngine,
  attributes: {Temple, :attributes}

config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
    --config=assets/tailwind.config.js
    --input=assets/css/app.css
    --output=_site/css/site.css
    )
  ]

config :tableau, :assets, tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}

config :tableau, :config,
  url: "http://localhost:4999",
  timezone: "America/Indiana/Indianapolis",
  markdown: [mdex: [features: [syntax_highlight_theme: "kanagawa"]]]

config :tableau, Tableau.PostExtension,
  enabled: true,
  future: true

config :tableau, Tableau.DataExtension, enabled: true

config :tableau, Tableau.RSSExtension,
  enabled: true,
  title: "elixir-tools",
  description: "The best Elixir dev tooling that has ever existed"

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

import_config "#{Mix.env()}.exs"
