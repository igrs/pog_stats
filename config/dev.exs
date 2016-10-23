use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :pog_stats, PogStats.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [npm: ["run", "watch"]]


# Watch static and templates for browser reloading.
config :pog_stats, PogStats.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :pog_stats, PogStats.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "igrs",
  password: "igrs",
  database: "pog_stats_dev",
  hostname: "localhost",
  pool_size: 10

config :guardian, Guardian,
  issuer: "PogStats",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: "730d7ccacc0854e2c819a17be3755a177a2a74497b9359cc0f67f6ddd0fcb2d8",
  serializer: PogStats.GuardianSerializer

#config :ueberauth, Ueberauth,
#  providers: [
#    google: {Ueberauth.Strategy.Google, []},
#  ]

#config :ueberauth, Ueberauth.Strategy.Google.OAuth,
#  client_id: System.get_env("GOOGLE_CLIENT_ID"),
#  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")
