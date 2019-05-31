# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :goalsystem,
  ecto_repos: [Goalsystem.Repo]

# Configures the endpoint
config :goalsystem, GoalsystemWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "t+dmdyAM/FepY4YK4AtMS53C9dp5JuGnEPjG/ozvZtDWM0MMGBjocnP1GGbuXWD1",
  render_errors: [view: GoalsystemWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Goalsystem.PubSub, adapter: Phoenix.PubSub.PG2]

# Config pow
config :goalsystem, :pow,
  user: Goalsystem.Users.User,
  repo: Goalsystem.Repo

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
