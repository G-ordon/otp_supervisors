
import Config

config :sequence2, Sequence2.Repo,
  username: "postgres",
  password: "postgres",
  database: "sequence2_dev",
  hostname: "localhost",
  pool_size: 10

config :sequence2, Sequence2Web.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :stacktrace_depth, 20
