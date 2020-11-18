# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :orders,
  ecto_repos: [Orders.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :orders, OrdersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IzYWUfe8G4XjjOjmobGdXbirgfexprrhhcsNPKyBD8rfequwtcn8lVdmwsfnlT4y",
  render_errors: [view: OrdersWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Orders.PubSub,
  live_view: [signing_salt: "QTVmsdQN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
