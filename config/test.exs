import Config

# Configure the endpoint for the test environment
config :sequence2, Sequence2Web.Endpoint,
  http: [port: 4002],  # Use a different port for test environment
  secret_key_base: "test_secret_key_base",  # Replace with a secure key for test
  server: false,  # Disable the server during test
  code_reloader: false,  # Disable code reloader during tests
  check_origin: false,
  watchers: []

# Configure the database repository for tests
config :sequence2, Sequence2.Repo,
  username: "postgres",
  password: "postgres",
  database: "sequence2_test#{System.get_env("MIX_TEST_PARTITION")}",  # Partition tests with MIX_TEST_PARTITION for CI
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox  # Use SQL sandbox mode for isolated tests

# Configure the logger for tests
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id],
  level: :warn  # Print only warnings and errors during test

# LiveView configuration (optional)
config :sequence2, Sequence2Web.Endpoint,
  live_view: [signing_salt: "test_live_view_salt"]

# Import environment specific config
import_config "#{Mix.env()}.exs"
