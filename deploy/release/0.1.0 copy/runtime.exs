import config

#Runtime configuration for different environments
if config_env() == :prod do
  # Configure the database repository
  config :sequence2, Sequence2.Repo,
    url: System.fetch_env!("DATABASE_URL"),  # Fetch the database URL from an environment variable
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")  # Default pool size is 10

  # Configure the web endpoint
  config :sequence2, Sequence2Web.Endpoint,
    http: [
      port: String.to_integer(System.get_env("PORT") || "4000")  # Default port is 4000
    ],
    secret_key_base: System.fetch_env!("SECRET_KEY_BASE"),  # Fetch the secret key base from an environment variable
    server: true  # Ensure the server is started in production

  # Additional configurations for other services can be added here
end
