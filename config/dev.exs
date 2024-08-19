import Config

# Configure the endpoint for the development environment
config :sequence2, Sequence2Web.Endpoint,
  url: [host: "localhost", port: 4000],  # Localhost and default port for development
  http: [port: 4000],
  secret_key_base: "your_dev_secret_key_base",  # Replace with a secure key for development
  debug_errors: true,
  code_reloader: true,  # Enable code reloading for development
  check_origin: false,
  watchers: []

# Configure the database repository
config :sequence2, Sequence2.Repo,
  username: "postgres",
  password: "postgres",
  database: "sequence2_dev",
  hostname: "localhost",
  pool_size: 10

# Configure the logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# LiveView configuration
config :sequence2, Sequence2Web.Endpoint,
  live_view: [signing_salt: "your_dev_live_view_salt"]

# Set the plug initialization mode to :compile for faster development compilation
config :phoenix, :plug_init_mode, :compile

# Import environment specific config
import_config "#{Mix.env()}.exs"
