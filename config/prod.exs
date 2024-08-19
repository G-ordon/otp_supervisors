import Config

config :sequence2, Sequence2.Repo,
  username: System.get_env("DATABASE_USER"),
  password: System.get_env("DATABASE_PASS"),
  database: System.get_env("DATABASE_NAME"),
  hostname: System.get_env("DATABASE_HOST"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "15")  # Default pool size is 15

config :sequence2, Sequence2Web.Endpoint,
  url: [host: System.get_env("HOST"), port: 443],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Mix.Project.config()[:version]

config :logger, level: :info

import_config "prod.secret.exs"
