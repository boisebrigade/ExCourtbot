use Mix.Config

config :courtbot, CourtbotWeb.Endpoint,
  url: [host: "localhost"],
  https: [
    port: 4000,
    cipher_suite: :strong,
    certfile: "priv/cert/selfsigned.pem",
    keyfile: "priv/cert/selfsigned_key.pem"
  ],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  render_errors: [view: CourtbotWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Courtbot.PubSub, adapter: Phoenix.PubSub.PG2],
  watchers: [
    npm: [
      "run",
      "start",
      cd: Path.expand("../assets", __DIR__)
    ],
    npm: [
      "run",
      "webpack",
      cd: Path.expand("../assets", __DIR__)
    ]
  ],
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$}
    ]
  ]

config :phoenix, :stacktrace_depth, 20

config :logger, level: :info

config :courtbot, CourtbotWeb.Endpoint,
  secret_key_base: "1C969829A72C108979C56C5F49ACF80D7F51DEC4C8398D96BEBCFE3B94332B17"

config :courtbot, Courtbot.Vault,
  ciphers: [
    default: {
      Cloak.Ciphers.AES.GCM,
      tag: "AES.GCM.V1", key: Base.decode64!("QkMwMjkxNzVCQjk5MDJEMERFNEM2ODYyNTMzMTREQUU=")
    }
  ]

config :courtbot, Courtbot.Repo,
  url: "postgres://postgres:postgres@localhost:5432/courtbot",
  pool_size: 10

config :guardian, Guardian,
  issuer: "courtbot",
  secret_key: "53B64BFDE8AA12298B09F2D01030CC3A16A93D48102B9EF92B8A68F3CB216356"
