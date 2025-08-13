defmodule SuperRaffle.Repo do
  use Ecto.Repo,
    otp_app: :super_raffle,
    adapter: Ecto.Adapters.Postgres
end
