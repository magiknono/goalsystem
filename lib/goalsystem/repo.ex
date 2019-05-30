defmodule Goalsystem.Repo do
  use Ecto.Repo,
    otp_app: :goalsystem,
    adapter: Ecto.Adapters.Postgres
end
